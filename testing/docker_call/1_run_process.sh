source ../../docker/docker_image.sh

DATAD="/diskmnt/Projects/cptac/GDC_import/data/43df9351-95d7-4e54-a648-1617c8bd78a0"
DATAD2="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/td-results"
OUTD="/home/mwyczalk_test/Projects/TinDaisy/modules/FFPE_Filter-dev/test-output"

VCF="/data2/call-merge_filter_td/execution/output/filtered.vcf"
BAM="/data/e984c099-8c3b-4306-9fe6-14d31ad40b0c_wxs_gdc_realn.bam"
OUT="/results/output-process-docker.vcf"

SYSTEM=docker   
START_DOCKERD="../../src/WUDocker"  # https://github.com/ding-lab/WUDocker.git
VOLUME_MAPPING="$DATAD:/data $DATAD2:/data2 $OUTD:/results"

CMD="bash /opt/FFPE_Filter/src/FFPE_Filter_process_vcf.sh -o $OUT $VCF $BAM $@"

# Also need: /storage1/fs1/dinglab/Active/CPTAC3/Common/CPTAC3.catalog
>&2 echo Launching $IMAGE_PROCESS on $SYSTEM
CMD="bash $START_DOCKERD/start_docker.sh -I $IMAGE_PROCESS -M $SYSTEM -c \"$CMD\" $@ $VOLUME_MAPPING "
echo Running: $CMD
eval $CMD

echo Written to $OUT
