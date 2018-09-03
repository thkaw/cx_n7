# build
docker build -t cx_n7 .

# run
docker run -v /home/nathan/cx/codebase/imx6_android_N7.1.1_1.0.0-ga/:/var/aosp7/ -i -t --name cx_n7_01 cx_n7 bash

# resume
docker start -i -a cx_n7_01 

# remove
docker container rm cx_n7_01 
