source ../../docker/docker_image.sh

OUTD="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/test-output"

VCF="/results/output-process-docker.vcf"
OUT="/results/output-parse-docker.vcf"

SYSTEM=docker   
START_DOCKERD="../../src/WUDocker"  # https://github.com/ding-lab/WUDocker.git
VOLUME_MAPPING="$OUTD:/results"

CMD="bash /opt/FFPE_Filter/src/FFPE_Filter_parse_vcf.sh -o $OUT $VCF $@"

# Also need: /storage1/fs1/dinglab/Active/CPTAC3/Common/CPTAC3.catalog
>&2 echo Launching $IMAGE_PARSE on $SYSTEM
CMD="bash $START_DOCKERD/start_docker.sh -I $IMAGE_PARSE -M $SYSTEM -c \"$CMD\" $@ $VOLUME_MAPPING "
echo Running: $CMD
eval $CMD

echo Written to $OUT
