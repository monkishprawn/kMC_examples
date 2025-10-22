param set type=map<string,string> key=MC/General/materials value="Iron Fe Gas Gas"
set size 140.5
set time 300

proc material { x y z } { return "Iron" }

init	minx=0 miny=0 minz=0 \
	maxx=$size maxy=$size maxz=$size \
	material=material

source Fe.source.tcl

cascade file=electron.cascade format=B:C*.287:D*.287:E*.287 \
periodic fluence=[expr 1/(1e-14*$size*$size)] flux=0 do.not.react


set T0	77
set a	1.030927
set i	0

set oldT	0
set oldTotal	0

# Overwrite output files
set	FILE [open "result.txt" w]
save	lammps=evolution

proc writeDefects {} {

	global FILE
	global T
	global oldTotal
	global oldT

	set total	[extract no.print count.particles]
	set derivative	[expr ($total - $oldTotal)/($T - $oldT)]

	set I_MP	[extract no.print count.particles particle=I defect=MobileParticle]
	set V_MP        [extract no.print count.particles particle=V defect=MobileParticle]

	set I_clus	[extract no.print count.particles defect=ICluster]
	set V_clus	[extract no.print count.particles defect=VCluster]

	set I2		[extract no.print count.particles defect=ICluster ID=I2]
	set I3		[extract no.print count.particles defect=ICluster ID=I3]
	set V2		[extract no.print count.particles defect=VCluster ID=V2]
	set V3		[extract no.print count.particles defect=VCluster ID=V3] 
	
	set oI		[expr $I_clus - $I2 - $I3]
	set oV		[expr $V_clus - $V2 - $V3]

	set I111	[extract no.print count.particles defect=<111>]

	puts $FILE "$T $total $derivative ${I_MP} ${V_MP} $I2 $V2 $I3 $V3 $oI $oV $I111"

	save lammps=evolution append	 

	set oldTotal    $total
        set oldT        $T
}

while { $i < 20 } {

	incr i
	set T [expr ${T0}*pow($a, $i)]

	anneal time=$time temp=[expr $T - 273.15]
	
	writeDefects

}

close $FILE

