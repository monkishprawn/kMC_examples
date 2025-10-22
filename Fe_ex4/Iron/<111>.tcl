param set type=string key=Iron/<111>/shape		value=disk
param set type=float  key=Iron/<111>/density.cm2 	value=1.95e15
param set type=string key=Iron/<111>/migration.type 	value=perpendicular
param set type=coordinates key=Iron/<111>/axis.1 	value={ 0 -1 1 }
param set type=coordinates key=Iron/<111>/axis.0 	value={ 2 -1 -1 }
param set type=coordinates key=Iron/<111>/not.in.plane  value={ 0 0 0 }
param set type=float  key=Iron/<111>/axes.ratio		value=1
param set type=bool   key=Iron/<111>/IV.model		value=false
param set type=bool   key=Iron/<111>/percolation	value=true
param set type=float  key=Iron/<111>/lambda		value=0.287

param set type=string key=Iron/<111>/to			value=<111>  
param set type=string key=Iron/<111>/from		value=ICluster

param set type=proc key=Iron/<111>/migration   value={ { set list ""	
	#puts "starting migration procedure"
	for { set n 2 } { $n < 5000 } { incr n } {
		if { $n == 2 } { 
			set pref 4.69e-2; set ener 0.40 
		} elseif { $n == 3 } { 
			set pref 1.62e-3; set ener 0.40 
		} elseif { $n == 4 } { 
			set pref 1.64e-2; set ener 0.40 
		} elseif { $n == 5 } { 
			set pref 2.10e-4; set ener 0.05 
		} elseif { $n == 6 } { 
			set pref 2.21e-4; set ener 0.05 
		} elseif { $n <  37 } { 
			set pref0 [expr 1.107e-2 * 1.0048 / pow($n,0.8)]
			set ratio [expr 5.3e-5*pow($n,2) - 0.0008*$n + 0.0041]
			set pref  [expr $pref0 * $ratio]
			set ener 0.05
		} elseif { $n < 91 } {
			set pref0 [expr 1.107e-2 * 1.0048 / pow($n,0.8)]
			set ratio [expr -4.99e-6*pow($n,3) + 0.0006715*pow($n,2) - 0.0167*$n -0.0003]
			set pref  [expr $pref0 * $ratio]
			set ener 0.05
		} elseif { $n < 331 } {
			set pref0 [expr 1.107e-2 * 1.0048 / pow($n,0.8)]
			set ratio [expr -7.78e-6*pow($n,2) + 0.005366*$n -0.147]
			set pref  [expr $pref0 * $ratio]
			set ener 0.05
		} else {
			set pref0 [expr 1.107e-2 * 1.0048 / pow($n,0.8)]
			set ratio 0.777
			set pref  [expr $pref0 * $ratio]
			set ener 0.05
		}
		lappend list I$n < $pref $ener >
		set carbon [expr int(0.429*sqrt($n))-1]
		if { $carbon > 20 } { set carbon 20 }
		if { $carbon > 0 } {
			set pref 0
			set ener 5
			for { set m 1} { $m < [expr $carbon+1] } { incr m } {
				lappend list C${m}I${n} < 0% $pref $ener 100% $pref $pref >
			}
		} 
	}
	#puts "finished migration procedure"
	return $list
} }

param set type=proc key=Iron/<111>/formation value={ { set list ""	
	#puts "starting formation procedure"
	set pi 3.14159265
	for { set n 2 } { $n < 5000 } { incr n } {
		set pot 0
		if { $n < 6 } {
			# ener is the binding energy
			# pot is the sum (negative) of all the binding energies
			set e [expr 2./3.]
			set Ef 3.64
			set Eb2 0.80
			if { $n == 2 } { set ener 0.8  }
			if { $n == 3 } { set ener 0.92 }
			if { $n == 4 } { set ener 1.64 }
			if { $n == 5 } { set ener [expr $Ef + ($Eb2 - $Ef)*(pow($n,$e)-pow($n-1,$e))/.587401] }
			set pot [expr $pot - $ener]
			lappend list I$n < [expr $n*$Ef + $pot ] >
		} else {
			# ener now is the formation energy
			set c0  1.60485
			set c1  5.35226
			set c2 -0.147319
			set ener [expr $c2 + sqrt($n)*($c1 + $c0*log($n))]
			lappend list I$n < $ener >
			set carbon [expr int(2*$pi*0.429*sqrt($n))-1]
			if { $carbon > 20 } { set carbon 20 }
			if { $carbon > 0 } {
				set EbC 0.5
				for { set m 1} { $m < [expr $carbon+1] } { incr m } {
					lappend list C${m}I${n} < [expr $ener - ($EbC*$m) ] >
				}
			}

		}
	}
	#puts "finished formation procedure"
	return $list
} }


param set type=proc key=Iron/<111>/prefactor value={ {        set list ""
	#puts "starting prefactor procedure"
	set pi 3.14159265
	for { set n 2 } { $n < 5000 } { incr n } {
		set pref1 1.107e-2
		if { $n < 10 } {
			set pref [expr $pref1 * $n]
			lappend list I$n,I
			lappend list $pref
		} else {
			set pref [expr $pref1 * sqrt(6*3.14159265*$n) / pow(3,0.25)]
			lappend list I$n,I
			lappend list $pref
			set carbon [expr int(2*$pi*0.429*sqrt($n))-1]
			if { $carbon > 20 } { set carbon 20 }
			if { $carbon > 0 } {
				for { set m 1} { $m < [expr $carbon+1] } { incr m } {
					if { $m == 1 } {
						lappend list C${m}I${n},C
						lappend list [ expr $pref1 * $m ] 
					} else {
						lappend list C${m}I${n},C
						lappend list [ expr $pref1 * $m ] 
					}
				}
			}
		}
	}
	#puts "finished prefactor procedure"
	return $list
} }


