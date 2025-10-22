# MMonCa simulation of tungsten defect  diffusion after a collision cascade

## --------- Simulation parameters -------- ##
# System size in nm (nanometers)		#
set halfbox [expr 24.335599888322048*3]

# units seconds
set tTotal 1e-4
set n_cascades 1
set snapshot_interval 1e-8 

# units Kelvin
set T 300

# Random seed					
set seed 123555

## ----------------------------------- ##

# ---------- Read parameters --------- ##
source Fe.source.tcl
## ----------------------------------- ##

## ------- Define the material ------- ##
param set type=map<string,string>   key=MC/General/materials value="Iron Fe Gas Gas"
#param set type=map<string,string>   key=MC/Particles/elements value={ W Tungsten ,74,183.84 He Helium,2,4.002602 C Carbon,6,12.011 }

proc material { x y z } { 
	global halfbox
	if {($x > $halfbox) || ($x < -$halfbox)} { return "Gas"} 
	if {($y > $halfbox) || ($y < -$halfbox)} { return "Gas" } 
	if {($z > $halfbox) || ($z < -$halfbox)} { return "Gas" } 

	return "Iron" 
}

# periodic boundary conditions in all three orthogonal directions
param set type=bool		key=MC/Mesh/periodic.x value=false
param set type=bool     key=MC/Mesh/periodic.y value=false
param set type=bool     key=MC/Mesh/periodic.z value=false

# define the simulation box size and populate it with the material lattice
init minx=-$halfbox miny=-$halfbox minz=-$halfbox maxx=$halfbox maxy=$halfbox maxz=$halfbox material=material

## ----------------------------------- ##

## ------ Define snapshot ------- ##
# output every 10 events
#param set type=float    key=MC/General/snapshot.events        			value=100
param set type=float	 key=MC/General/snapshot.time.min      			value=1e-8
param set type=float	 key=MC/General/snapshot.time.delta    			value=0.0
param set type=int		 key=MC/General/snapshot.time.decade			value=100

## ------------------------------ ##
			
# set the random seed
param set type=int	key=MC/General/random.seed value=$seed

# Y Z area	
set area [ expr $halfbox*$halfbox*4 ]

# units cm^-2 
set fluence [ expr $n_cascades*1e14 / $area ] 

# units cm^-2 s^-1
set flux [ expr $fluence / $tTotal ]


## ------- Run simulation ------- ##
# Read cascade input data fluence in cm^-2
cascade file=out.xyz format=A:B/10:C/10:D/10 periodic fluence=$fluence flux=0 do.not.react do.not.shift

save lammps=evolution scale=10

set time 0

while { $time < $tTotal } {

	# Dynamic annealing
	anneal temp=[expr $T - 273.15] time=$snapshot_interval
	## ------------------------------ ##
	save lammps=evolution scale=10 append
	#set time [extract time]
	set time [expr $time + $snapshot_interval]
	
}

snapshot
# Output

 
