class: Workflow
cwlVersion: v1.0
id: ffpe_filter
label: FFPE_Filter
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: VCF
    type: File
    'sbg:x': -578.3956298828125
    'sbg:y': -221
  - id: BAM
    type: File
    'sbg:x': -549.3956298828125
    'sbg:y': -68
outputs:
  - id: output
    outputSource:
      - ffpe_filter_parse_vcf/output
    type: File
    'sbg:x': 116.60113525390625
    'sbg:y': -195
steps:
  - id: ffpe_filter_process_vcf
    in:
      - id: VCF
        source: VCF
      - id: BAM
        source: BAM
    out:
      - id: output
    run: ./ffpe_filter_process_vcf.cwl
    label: FFPE_Filter_process_vcf
    'sbg:x': -341
    'sbg:y': -145
  - id: ffpe_filter_parse_vcf
    in:
      - id: VCF
        source: ffpe_filter_process_vcf/output
    out:
      - id: output
    run: ./ffpe_filter_parse_vcf.cwl
    label: FFPE_Filter_parse_vcf
    'sbg:x': -102
    'sbg:y': -146
requirements: []
