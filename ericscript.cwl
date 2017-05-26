arguments:
- {position: 3, valueFrom: $(inputs.fastq1)}
- {position: 4, valueFrom: $(inputs.fastq2)}
baseCommand: [ericscript.pl]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- doc: Ensembl files, see downloadFromGdrive.py
  id: datadir
  inputBinding: {prefix: --dbfolder}
  type: Directory
- {id: fastq1, type: File}
- {id: fastq2, type: File}
- default: mypatient
  id: name
  inputBinding: {prefix: --name}
  type: ['null', string]
- default: outdir
  doc: Directory for output files
  id: outputdir
  inputBinding: {prefix: --outputfolder}
  type: ['null', string]
label: EricScript fusion caller tool by Matteo Benelli
outputs:
- id: output
  outputBinding: {glob: $(inputs.outputdir)/$(inputs.name).results.filtered.tsv}
  type: File
requirements:
- {class: DockerRequirement, dockerPull: jeltje/ericscript}
