# Example command to run within docker.  Typically, start docker first with 0_start_docker.sh

VCF="/data2/call-merge_filter_td/execution/output/filtered.vcf"
BAM="/data/e984c099-8c3b-4306-9fe6-14d31ad40b0c_wxs_gdc_realn.bam"

OUT="/results/output.vcf"

# Based on https://github.com/mikdio/SOBDetector
CMD="java -jar /opt/SOBDetector_v1.0.4.jar \
    --input-type VCF \
    --input-variants $VCF \
    --input-bam $BAM \
    --output-variants $OUT \
    --only-passed true "

>&2 echo Running: $CMD
eval $CMD

rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal ERROR $rc: $!.  Exiting.
    exit $rc;
fi

>&2 echo Success.  Written to $OUT
