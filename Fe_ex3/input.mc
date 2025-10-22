set filename defect_accumulation

## ----- Definition of parameters ------ ##
# units seconds
set time [expr 60*60*24]
# units kelvin
set T		7
set n_cascades  3000000

# units nm
set a0          [param get type=float key=Iron/Lattice/parameter]
set size      [expr $a0 * 80]
# units cm^-2
set fluence	[expr ${n_cascades}/(1e-14*${size}*${size})]
# units cm^-2 s^-1
set flux	[expr ${fluence}/${time}]


## ---------- Read parameters --------- ##
source Fe.source.tcl
## ------------------------------------ ##

proc snapshot {} {
	global filename
	global flux
	global size

	set time	[extract time]
	set fluence	[expr $time*$flux]
	set n		[expr $time*$flux*1e-14*${size}*${size}]

	set I_MP	[extract no.print count.particles particle=I defect=MobileParticle]
        set V_MP	[extract no.print count.particles particle=V defect=MobileParticle]
	set d111	[extract no.print count.particles defect=<111>]
        set d100	[extract no.print count.particles defect=<100>]
        set dV100	[extract no.print count.particles defect=V<100>]
        set VClus	[extract no.print count.particles defect=VCluster]
        set IClus	[extract no.print count.particles defect=ICluster]

	set	FILE [open "${filename}_defects.data" a]
	puts	$FILE "$n ${fluence} ${V_MP} ${I_MP} ${d111} ${d100} ${dV100} ${VClus} ${IClus}"
	close	$FILE

	save lammps=${filename} scale=10 append
}

## ------- Define the material -------- ##
param set type=map<string,string>   key=MC/General/materials value="Iron Fe Gas Gas"

proc material { x y z } { 
	return "Iron" 
}

init minx=0 miny=0 minz=0 maxx=${size} maxy=${size} maxz=${size} material=material
## ------------------------------------ ##

# Rewrite file 
set   FILE [open "${filename}_defects.data" w]
puts  $FILE "fluence V_MP I_MP d111 d100 IClus VClus"
close $FILE

save lammps=${filename} scale=10


# Apply cascades
cascade file=defects.xyz format=B:C:D:E periodic fluence=$fluence flux=$flux temp=[ expr $T - 273.15 ] voluminic overlap

# save final frame
snapshot


