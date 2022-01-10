# Example command to run within docker.  Typically, start docker first with 0_start_docker.sh

VCF="/results/output-process.vcf"
OUT="/results/output-parse.vcf"

cd ../..
CMD="bash src/FFPE_Filter_parse_vcf.sh -o $OUT $VCF $@"

>&2 echo Running: $CMD
eval $CMD

rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal ERROR $rc: $!.  Exiting.
    exit $rc;
fi

>&2 echo Success.  Written to $OUT
