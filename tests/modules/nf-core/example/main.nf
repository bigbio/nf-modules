#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { EXAMPLE } from '../../../../modules/nf-core/example/main.nf'

workflow test_example {
    input = [
        [ id:'test' ], // meta map
        file(params.test_data['test_file'], checkIfExists: true)
    ]

    EXAMPLE ( input )
}
