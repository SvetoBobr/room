 #!/bin/bash
 

openscad -o /home/beaver/stl/vacuum_cleaner/cones.stl -D part=1 ./cleaner-v1.scad
openscad -o /home/beaver/stl/vacuum_cleaner/inflow.stl -D part=2 ./cleaner-v1.scad
openscad -o /home/beaver/stl/vacuum_cleaner/outflow.stl -D part=3 ./cleaner-v1.scad	

openscad -o /home/beaver/stl/vacuum_cleaner/motor.stl -D part=4 ./cleaner-v1.scad	

echo all done
