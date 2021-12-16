
#DATAD="/home/mwyczalk_test/Projects/TinDaisy/testing/C3L-00908-data/dat/call-hotspot_vld_varscan_snv/hotspot_vld.cwl/27ac9be3-7575-4477-8f85-5d3652992ee9/call-vaf_length_depth_filters_B"
DATAD="/gscmnt/gc2541/cptac3_analysis/cromwell-workdir/cromwell-executions/tindaisy2.cwl/975a4e56-8a1b-4c43-a306-3f0831760a14"

# changing directories so entire project directory is mapped by default
cd ../..
OUTD="testing/direct_call/results"  # output dir relative to ../..
mkdir -p $OUTD

source docker/docker_image.sh
IMAGE=$IMAGE

bash docker/WUDocker/start_docker.sh $@ -I $IMAGE $DATAD:/data $OUTD:/results


