class: CommandLineTool
cwlVersion: v1.0
id: ffpe_filter_process_vcf
baseCommand:
  - /bin/bash
  - /opt/FFPE_Filter/src/FFPE_Filter_process_vcf.sh
inputs:
  - id: VCF
    type: File
    inputBinding:
      position: 1
    label: VCF file to process
  - id: BAM
    type: File
    inputBinding:
      position: 2
    secondaryFiles:
      - .bai
    label: Tumor BAM file
outputs:
  - id: output
    type: File
    outputBinding:
      glob: results/output-process.vcf
label: FFPE_Filter_process_vcf
arguments:
  - position: 0
    prefix: '-o'
    valueFrom: results/output-process.vcf
requirements:
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/ffpe_filter_process:20211216'
  - class: ResourceRequirement
    ramMin: 2000
