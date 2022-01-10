# bin/bash

read -r -d '' USAGE <<'EOF'
Filter out calls marked as FFPE Filter artifacts

Usage:
  bash FFPE_Filter_parse_vcf.sh [options] input.vcf 

Options:
-h: Print this help message
-d: Dry run - output commands but do not execute them
-v: print filter debug information
-o OUT_VCF : Output VCF filename.  Default: write to stdout
-B: bypass this filter, i.e., do not remove any calls
-R: remove filtered variants.  Default is to retain filtered variants with filter name in VCF FILTER field

EOF

source /opt/FFPE_Filter/src/utils.sh
SCRIPT=$(basename $0)
export PYTHONPATH="/opt/FFPE_Filter/src:$PYTHONPATH"

# http://wiki.bash-hackers.org/howto/getopts_tutorial
while getopts ":hdvo:BR" opt; do
  case $opt in
    h)
      echo "$USAGE"
      exit 0
      ;;
    d)  # binary argument
      DRYRUN=1
      ;;
    v)  # binary argument
      FILTER_ARG="$FILTER_ARG --debug"
      ;;
    o) # value argument
      OUT_VCF="$OPTARG"
      ;;
    B)  # binary argument
      FILTER_ARG="$FILTER_ARG --bypass"
      ;;
    R)
      FILTER_ARG="--no-filtered"
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

if [ "$#" -ne 1 ]; then
    >&2 echo ERROR: Wrong number of arguments
    >&2 echo "$USAGE"
    exit 1
fi
VCF=$1; shift
confirm $VCF

export PYTHONPATH="/opt/FFPE_Filter/src:$PYTHONPATH"

FILTER_CALL="/usr/local/bin/vcf_filter.py $FILTER_ARG --local-script ffpe_filter_parser.py "  # filter module

CMD="cat $VCF | /usr/local/bin/python $FILTER_CALL - ffpe $FILTER_ARG "

if [ "$OUT_VCF" ]; then

    OUTD=$(dirname $OUT_VCF)
    mkdir -p $OUTD
    test_exit_status

    CMD="$CMD > $OUT_VCF"
fi

run_cmd "$CMD" $DRYRUN

if [ "$OUT_VCF" ]; then
    >&2 echo Written to $OUT_VCF
fi
