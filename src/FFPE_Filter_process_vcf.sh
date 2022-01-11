#/bin/bash

read -r -d '' USAGE <<'EOF'
Run SOBDetector to identify FFPE artefacts in VCF

Usage: FFPE_Filter_process_vcf.sh [options] VCF BAM

Options:
-h: Print this help message
-d: Dry run - output commands but do not execute them
-o OUT_VCF : Output VCF filename.  Directory will be created.  Default: output/merged.vcf
-X XARGS : additional arguments passed to SOBDetector

Details of SOBDetector: https://github.com/mikdio/SOBDetector

VCF file and corresponding BAM are required
EOF

source /opt/FFPE_Filter/src/utils.sh
SCRIPT=$(basename $0)

JAVA="/usr/local/openjdk-11/bin/java"
JAR="/opt/SOBDetector_v1.0.4.jar"

OUT_VCF="output/merged.vcf"

# http://wiki.bash-hackers.org/howto/getopts_tutorial
while getopts ":hdo:X:" opt; do
  case $opt in
    h)
      echo "$USAGE"
      exit 0
      ;;
    d)  # binary argument
      DRYRUN=1
      ;;
    o) # value argument
      OUT_VCF="$OPTARG"
      ;;
    X) # value argument
      XARGS="$OPTARG"
      ;;
    \?)
      >&2 echo "Invalid option: -$OPTARG"
      >&2 echo "$USAGE"
      exit 1
      ;;
    :)
      >&2 echo "Option -$OPTARG requires an argument."
      >&2 echo "$USAGE"
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

if [ "$#" -ne 2 ]; then
    >&2 echo ERROR: Wrong number of arguments
    >&2 echo "$USAGE"
    exit 1
fi

VCF=$1 && confirm $VCF
BAM=$2 && confirm $BAM

OUTD=$(dirname $OUT_VCF)
mkdir -p $OUTD
test_exit_status


# Based on https://github.com/mikdio/SOBDetector
CMD="$JAVA -jar $JAR \
    --input-type VCF \
    --input-variants $VCF \
    --input-bam $BAM \
    --output-variants $OUT_VCF \
    --only-passed false \
    $XARGS"

run_cmd "$CMD" $DRYRUN

>&2 echo Unfiltered VCF written to $OUT_VCF

