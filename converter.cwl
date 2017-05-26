baseCommand: [ericToBedpe]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- default: 0.7
  id: escore
  inputBinding: {prefix: --escore}
  type: ['null', float]
- id: inputfile
  inputBinding: {position: 3}
  type: File
- default: 2
  id: reads
  inputBinding: {prefix: --reads}
  type: ['null', int]
outputs:
- id: fusionout
  outputBinding: {glob: output.bedpe}
  type: File
requirements:
- {class: DockerRequirement, dockerPull: jeltje/ericscript}
stdout: output.bedpe
