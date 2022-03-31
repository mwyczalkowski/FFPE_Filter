class: CommandLineTool
cwlVersion: v1.0
id: ffpe_filter_parse_vcf
baseCommand:
  - /bin/bash
  - /opt/FFPE_Filter/src/FFPE_Filter_parse_vcf.sh
inputs:
  - id: VCF
    type: File
    inputBinding:
      position: 0
  - id: bypass
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-B'
    label: Bypass FFPE filter
    doc: 'If set, FFPE information written to VCF but no calls are excluded'
outputs:
  - id: output
    type: File
    outputBinding:
      glob: results/output-parse-docker.vcf
label: FFPE_Filter_parse_vcf
arguments:
  - position: 0
    prefix: '-o'
    valueFrom: results/output-parse-docker.vcf
requirements:
  - class: ResourceRequirement
    ramMin: 2000
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/ffpe_filter_parse:20211216'
