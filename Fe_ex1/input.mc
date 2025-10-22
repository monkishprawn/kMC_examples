set size 30
set time 1e-3
set T	 200

source Fe.source.tcl

# remove interactions
param set type=array<string,string> key=Iron/Models/interactions \
value={ I+I false }

## ----- Initialize system ---------- ##
param set type=map<string,string> key=MC/General/materials value="Iron Fe Gas Gas"

proc material { x y z } { return "Iron" }

init	minx=-$size miny=-$size minz=-$size \
	maxx=$size maxy=$size maxz=$size \
	material=material

## ----------------------------------- ##

# Insert damage
cascade file=defects.xyz format=A:B:C:D \
periodic fluence=[expr 1000/(1e-14*$size*$size)] flux=0 do.not.react 

# Overwrite output files
set	FILE [open "result.txt" w]
save	lammps=evolution

proc snapshot {} {

	global FILE
	set profile [extract profile name=I* dimension=1 material=Iron]
	puts $FILE $profile
	save lammps=evolution append	 
}

snapshot
anneal time=$time temp=[expr $T - 273.15]
snapshot

close $FILE

