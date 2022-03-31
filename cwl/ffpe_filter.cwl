class: Workflow
cwlVersion: v1.0
id: ffpe_filter
label: FFPE_Filter
inputs:
  - id: VCF
    type: File
  - id: tumor_BAM
    type: File
  - id: bypass
    type: boolean?
outputs:
  - id: output
    outputSource:
      - ffpe_filter_parse_vcf/output
    type: File
steps:
  - id: ffpe_filter_process_vcf
    in:
      - id: VCF
        source: VCF
      - id: BAM
        source: tumor_BAM
    out:
      - id: output
    run: ./ffpe_filter_process_vcf.cwl
    label: FFPE_Filter_process_vcf
  - id: ffpe_filter_parse_vcf
    in:
      - id: VCF
        source: ffpe_filter_process_vcf/output
      - id: bypass
        source: bypass
    out:
      - id: output
    run: ./ffpe_filter_parse_vcf.cwl
    label: FFPE_Filter_parse_vcf
requirements: []
