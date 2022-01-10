# Filter out FFPE artifacts from VCF file

There are two separate steps, each with their own script, docker image, and CWL tool:
* Process VCF
* Parse VCF

The first step calls [SOBDetector](https://github.com/mikdio/SOBDetector) on a VCF file.  The
second step parses the resulting VCF file and writes to the FILTER field of calls marked as `artifacts`.

Docker images: `mwyczalkowski/ffpe_filter_process:20211216` and `mwyczalkowski/ffpe_filter_parse:20211216`

Contact: Matt Wyczalkowski (m.wyczalkowski@wustl.edu)
