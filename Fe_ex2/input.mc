# MMonCa simulation of tungsten defect  diffusion after a collision cascade

## --------- Simulation parameters -------- ##
# System size in nm (nanometers)		#
set size [expr 24.335599888322048*3]

# Simulation time, units seconds
set time 1e-4 

# units Kelvin
set T 300

# Random seed					
set seed 123555

## ----------------------------------- ##

# ---------- Read parameters --------- ##
source Fe.source.tcl
## ----------------------------------- ##

# set the random seed
param set type=int      key=MC/General/random.seed value=$seed

## ------- Define the material ------- ##
param set type=map<string,string>   \
key=MC/General/materials value="Iron Fe Gas Gas"

proc material { x y z } { 
	return "Iron" 
}
## ----------------------------------- ##

# periodic boundary conditions in all three orthogonal directions
param set type=bool	key=MC/Mesh/periodic.x value=true
param set type=bool     key=MC/Mesh/periodic.y value=true
param set type=bool     key=MC/Mesh/periodic.z value=true

# define the simulation box size and populate it with the material lattice
init	minx=-$size miny=-$size minz=-$size \
	maxx=$size  maxy=$size  maxz=$size  \
	material=material

## ----------------------------------- ##

## ------ Define snapshot ------- ##

# automatically called by "anneal command" 10 times per decade 
proc snapshot { } {
	save lammps=evolution scale=10 append
}
## ------------------------------ ##

# Y Z area	
set area [ expr $size*$size*4 ]
# units cm^-2 
set fluence [ expr 1*1e14 / $area ] 

## ------- Run simulation ------- ##
# Read cascade input data, division by 10 for Å -> nm conversion
cascade file=out.xyz format=A:B/10:C/10:D/10 periodic \
fluence=$fluence flux=0 do.not.react do.not.shift
# save initial dump file
save lammps=evolution scale=10
# run OKMC
anneal temp=[expr $T - 273.15] time=$time

 
