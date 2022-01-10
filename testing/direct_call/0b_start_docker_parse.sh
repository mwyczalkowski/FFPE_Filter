# Input data to be found here
DATAD="/diskmnt/Projects/cptac/GDC_import/data/43df9351-95d7-4e54-a648-1617c8bd78a0"
DATAD2="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/td-results"

OUTD="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/test-output"

# changing directories so entire project directory is mapped by default
cd ../..
OUTD="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/test-output"
mkdir -p $OUTD

source docker/docker_image.sh

bash src/WUDocker/start_docker.sh $@ -I $IMAGE_PARSE $DATAD:/data $DATAD2:/data2 $OUTD:/results


