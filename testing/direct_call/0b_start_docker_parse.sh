# Input data to be found here

OUTD="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/test-output"

# changing directories so entire project directory is mapped by default
cd ../..
OUTD="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/test-output"
mkdir -p $OUTD

source docker/docker_image.sh

bash src/WUDocker/start_docker.sh $@ -I $IMAGE_PARSE $OUTD:/results


