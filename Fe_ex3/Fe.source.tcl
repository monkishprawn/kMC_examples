##parameters
set pi 3.14159265
set kB  8.6174e-5
##
## Impurities and most of reactions disabled for Onsager coeffs calculations
##

source Iron/Models.tcl
source Iron/Chromium.tcl
source Iron/Carbon.tcl

source Iron/Iron.tcl
source Iron/Vacancy.tcl

##
## Clusters are disabled for Onsager coeffs calculations
##

source Iron/ICluster.tcl
source Iron/<111>.tcl
source Iron/<100>.tcl

source Iron/VCluster.tcl
source Iron/V<100>.tcl

##
#param set type=float key=Iron/Models/grain.size value=1k
#param set type=map<string,string> key=MC/General/materials value="Iron Fe Gas Gas"
param set type=bool      key=MC/Mesh/speed.up   value=false
param set type=bool      key=Iron/Models/self.diffusion value=true
#param set type=bool      key=MC/Mesh/periodic.x value=false
#param set type=bool      key=MC/Mesh/periodic.y value=false
#param set type=bool      key=MC/Mesh/periodic.z value=false
#param set type=float     key=MC/Mesh/spacing.x  value=$cells
#param set type=float     key=MC/Mesh/spacing.y  value=$cells
#param set type=float     key=MC/Mesh/spacing.z  value=$cells
#param set type=float     key=MC/General/snapshot.events        value=5e8

#param set type=bool key=Iron/Models/onsager.coefficients value=false
param set type=float key=Iron/Models/smoothing.factor value=1
param set type=float key=Iron/Models/alloy.second.neighbor.contribution value=0.5

set xCell [param get type=float key=MC/Mesh/spacing.x]
set yCell [param get type=float key=MC/Mesh/spacing.y]
set zCell [param get type=float key=MC/Mesh/spacing.z]

set densityCm3 [param get type=float key=Iron/Models/atomic.density]

param set type=float key=Iron/Models/lambda value=0.287
