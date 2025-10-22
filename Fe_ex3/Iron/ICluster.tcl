param set type=string key=Iron/ICluster/shape		value=irregular
param set type=float  key=Iron/ICluster/density.cm3 	value=8.46e22
param set type=string key=Iron/ICluster/migration.type 	value=3d
param set type=coordinates key=Iron/ICluster/axis.1 	  value={ 0 1 0 }
param set type=coordinates key=Iron/ICluster/axis.0 	  value={ 0 0 1 }
param set type=coordinates key=Iron/ICluster/not.in.plane value={ 0 0 0 }
param set type=float  key=Iron/ICluster/axes.ratio	value=1
param set type=bool   key=Iron/ICluster/IV.model	value=false
param set type=bool   key=Iron/ICluster/percolation	value=true
param set type=float  key=Iron/ICluster/lambda		value=0.287

param set type=string key=Iron/ICluster/to		value=<100>  
param set type=string key=Iron/ICluster/from		value=<111>

param set type=proc key=Iron/ICluster/migration   value={ { set list ""	
	for { set n 2 } { $n < 10 } { incr n } {
		if { $n == 2 } { set pref 4.69e-2; set ener 0.40 }
		if { $n == 3 } { set pref 1.62e-3; set ener 0.40 }
		if { $n == 4 } { set pref 1.64e-2; set ener 0.40 }
		if { $n == 5 } { set pref 2.10e-4; set ener 0.05 }
		if { $n == 6 } { set pref 2.21e-4; set ener 0.05 }
		if { $n >  6 } { 
			set pref [expr 1.107e-2 * 1.0048 / pow($n,0.8)]
			set ener 0.05
		}
		lappend list I$n < $pref $ener >
	}
	return $list
} }

param set type=proc key=Iron/ICluster/transform.to value={ {  set list ""	
	for { set n 2 } { $n < 10 } { incr n } {
		lappend list I$n
		if { $n < 5 } {
			lappend list < 0 5 >
		}
	        if { $n >= 5 } {
			lappend list < 1 0 >
		}
	}
	return $list  
} }

param set type=proc key=Iron/ICluster/transform.from value={ { set list ""	
	for { set n 2 } { $n < 10 } { incr n } {
		lappend list I$n
		if { $n < 5 } {
			lappend list < 0 5 >
		}
		 if { $n >= 5 } {
			lappend list < 999 0 >
		}
	}
	return $list  
} }


param set type=proc key=Iron/ICluster/formation value={ { set list ""	
	set pot 0
	set e [expr 2./3.]
	set Ef 3.64
	set Eb2 0.80
	for { set n 2 } { $n < 10 } { incr n } {
		set ener [expr $Ef + ($Eb2 - $Ef)*(pow($n,$e)-pow($n-1,$e))/.587401]
		if { $n == 2 } { set ener 0.8  }
		if { $n == 3 } { set ener 0.92 }
		if { $n == 4 } { set ener 1.64 }
		
		set pot [expr $pot - $ener]
		lappend list I$n < [expr $n*$Ef + $pot ] >
	}
	return $list
} }

param set type=proc key=Iron/ICluster/prefactor value={ { set list ""	
	for { set n 2 } { $n < 10 } { incr n } {
		set pref [expr 1.107e-2*$n]
		lappend list I$n,I
		lappend list $pref
	}
	return $list
} }
