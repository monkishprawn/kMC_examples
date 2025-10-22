param set type=string key=Iron/V<100>/shape		value=disk
param set type=float  key=Iron/V<100>/density.cm2 	value=0.83e15
param set type=string key=Iron/V<100>/migration.type 	value=perpendicular
param set type=coordinates key=Iron/V<100>/axis.1 	value={ 0 1 0 }
param set type=coordinates key=Iron/V<100>/axis.0 	value={ 0 0 1 }
param set type=coordinates key=Iron/V<100>/not.in.plane value={ 1 0 0 }
param set type=float  key=Iron/V<100>/axes.ratio	value=1
param set type=bool   key=Iron/V<100>/IV.model		value=false
param set type=bool   key=Iron/V<100>/percolation	value=true
param set type=float  key=Iron/V<100>/lambda		value=0.287

param set type=string key=Iron/V<100>/to		value=VCluster
param set type=string key=Iron/V<100>/from		value=V<100>

param set type=proc key=Iron/V<100>/migration value={ {
        set list ""
        for { set size 2 } { $size < 500 } { incr size } {
              set pref 7e-2
              set ener 0.5
                lappend list V$size < $pref $ener >
        }
        return $list
} }

param set type=proc key=Iron/V<100>/formation value={ {
	set list ""	
	set pot 0
	set Efv 2.12
	for { set size 45 } { $size < 500 } { incr size } {
	        set e 2.7183
		set radius 4
		set density 0.083
		set R [expr sqrt($size/(3.14159*$density))]
		set ener [expr 6.28*$R*(0.465*log((4*$R)/($e*$radius))) + 0.39 + 0.5]
		lappend list V$size < $ener >
	}
	return $list
} }

param set type=proc key=Iron/V<100>/prefactor value={ {
	set list ""	
	for { set size 46 } { $size < 500 } { incr size } {
		set pref [expr 8.2e-3*$size]
		lappend list V$size,V
		lappend list $pref
	}
	return $list
} }

