param set type=map<string,bool> key=Iron/Models/particles 	index=CI		value=false
param set type=map<string,bool> key=Iron/Models/particles 	index=C			value=true
param set type=map<string,bool> key=Iron/Models/particles 	index=CV		value=true
param set type=map<string,bool> key=Iron/Models/particles 	index=He 		value=true
param set type=map<string,bool> key=Iron/Models/particles 	index=HeV		value=true
param set type=map<string,bool> key=Iron/Models/particles 	index=CrI		value=true
param set type=map<string,bool> key=Iron/Models/particles 	index=CrV		value=true
param set type=map<string,bool> key=Iron/Models/particles 	index=Cr		value=true
 
param set type=map<string,bool> key=Iron/Models/defined 	index=V<100> 		value=true
param set type=map<string,bool> key=Iron/Models/defined 	index=HeCluster		value=true

param set type=array<string,string> key=Iron/Models/interactions index=VCluster+Gas 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=ICluster+Gas 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>+Gas 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>+Gas 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=V<100>+Gas 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=C+Gas 		value=false

param set type=array<string,string> key=Iron/Models/interactions index=V+V 		value=VCluster,1.
param set type=array<string,string> key=Iron/Models/interactions index=ICluster+V<100> 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=VCluster+V<100> 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=V<100>:V*+V 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=V<100>:V*+I 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>+<111> 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>+<111> 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>+<100> 	value=true
param set type=array<string,string> key=Iron/Models/interactions index=C+I 		value=false
param set type=array<string,string> key=Iron/Models/interactions index=C+V 		value=true
param set type=array<string,string> key=Iron/Models/interactions index=CI+V 		value=false
param set type=array<string,string> key=Iron/Models/interactions index=CV+Gas 		value=true
param set type=array<string,string> key=Iron/Models/interactions index=CI+Gas 		value=false

#
param set type=array<string,string> key=Iron/Models/interactions index=I+I		value=ICluster,1.
param set type=array<string,string> key=Iron/Models/interactions index=I+V		value=0,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=V+V		value=VCluster,1.
param set type=array<string,string> key=Iron/Models/interactions index=CV+I 		value=true
param set type=array<string,string> key=Iron/Models/interactions index=CV+V 		value=VCluster,1.
param set type=array<string,string> key=Iron/Models/interactions index=CV+C 		value=VCluster,1.
param set type=array<string,string> key=Iron/Models/interactions index=CV+CV 		value=VCluster,1.
param set type=array<string,string> key=Iron/Models/interactions index=Cr+I 		value=true
param set type=array<string,string> key=Iron/Models/interactions index=Cr+V 		value=true

param set type=array<string,string> key=Iron/Models/interactions index=VCluster:V*+C	value=true
param set type=array<string,string> key=Iron/Models/interactions index=ICluster:I*+C	value=false
param set type=array<string,string> key=Iron/Models/interactions index=<100>:I*+C	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>:I*+CV	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>:I*+C	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>:I*+CV	value=true

param set type=array<string,string> key=Iron/Models/interactions index=<100>:I*+V	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<100>:I*+I	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<100>+ICluster	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<100>+VCluster	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<111>:I*+V	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<111>:I*+I	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<111>+ICluster	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=<111>+VCluster	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=ICluster:I*+V	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=ICluster:I*+I	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=ICluster+ICluster value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=ICluster+VCluster value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:V*+V	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:V*+I	value=true,0.9471
param set type=array<string,string> key=Iron/Models/interactions index=VCluster+VCluster value=true,0.9471
#

param set type=array<string,string> key=Iron/Models/interactions index=<111>:C*I*+C    	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>:C*I*+I    	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>:C*I*+V    	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<111>:C*I*+CV   	value=true

param set type=array<string,string> key=Iron/Models/interactions index=<100>:C*I*+C    	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>:C*I*+I    	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>:C*I*+V    	value=true
param set type=array<string,string> key=Iron/Models/interactions index=<100>:C*I*+CV    value=true


param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C2V+C	value=true
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C2V+I	value=false
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C2V+V	value=true
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C2V+CV	value=true

param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C3V+C	value=false
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C3V+I	value=false
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C3V+V	value=true
param set type=array<string,string> key=Iron/Models/interactions index=VCluster:C3V+CV	value=true



param set type=array<string> key=Iron/Models/interaction.result value={  {
	<100> +  <100> = <100>
	<100> ~=,.05 <111> = <100>
	<100> >  <111> = <100>
	<100> <  <111> = <111>
	<100> == VCluster = <100>
	<100> >  VCluster = <100>
	<100> <  VCluster = VCluster
	<100> +  ICluster  = <100>
	<100> +  HeCluster = HeCluster
	<100> == V<100>    = <100>
	<100> >  V<100>    = <100>
	<100> <  V<100>    = V<100>

	<111> ~=,.05 <111> = <100>
	<111> >  <111> = <111>
	<111> <  <111> = <111>
	<111> == VCluster = <111>
	<111> >  VCluster = <111>
	<111> <  VCluster = VCluster
	<111> +  ICluster  = <111>
	<111> +  HeCluster = HeCluster 
	<111> == V<100>    = <111>
	<111> >  V<100>    = <111>
	<111> <  V<100>    = V<100>
	
	VCluster +  VCluster = VCluster
	VCluster == ICluster = VCluster
	VCluster >  ICluster = VCluster
	VCluster <  ICluster = ICluster	
	VCluster +  HeCluster = HeCluster
	VCluster +  V<100>   = V<100>
	
	ICluster +  ICluster = ICluster
	ICluster +  HeCluster = HeCluster
	ICluster == V<100>    = ICluster
	ICluster >  V<100>    = ICluster
	ICluster <  V<100>    = V<100>
	
	HeCluster +  HeCluster = HeCluster 
	V<100> + V<100> = V<100>
} }
