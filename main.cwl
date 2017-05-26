class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jeltje@synapse.org,
  'foaf:name': jeltje}
doc: 'SMC-RNA challenge fusion detection submission

  EricScan fusion caller workflow'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: convert/fusionout, type: File}
requirements:
- {class: MultipleInputFeatureRequirement}
- {class: StepInputExpressionRequirement}
- {class: InlineJavascriptRequirement}
steps:
- id: convert
  in:
  - {id: inputfile, source: ericscript/output}
  out: [fusionout]
  run: converter.cwl
- id: ericscript
  in:
  - {id: datadir, source: tar/output}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  out: [output]
  run: ericscript.cwl
- id: tar
  in:
  - {id: outdir, valueFrom: $('ericscript_db_homosapiens_ensembl84')}
  - {id: tarfile, source: index}
  out: [output]
  run: tar.cwl
