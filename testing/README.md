Testing implementation of `FFPE_Filter` based on instructions here:
    https://github.com/mikdio/SOBDetector

Several levels of calls available for testing
* direct_call: Calling `java -jar SOBDetector.jar` directly from container
* docker_call: Instantiate docker container and call scripts within it
* cwl_call: Run cwltool or other CWL workflow manager

Input data is assumed to be in the parent directory of `FFPE_Filter`.
That is, relative to root directory of `FFPE_Filter`,
    VCF="../dat/variants.vcf"
    BAM="../dat/sequence.bam"

Similarly, output will be directed to,
    OUTD="../test-output"

