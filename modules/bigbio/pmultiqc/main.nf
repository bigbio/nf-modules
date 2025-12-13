process PMULTIQC {
    tag "$meta.id"
    label 'process_high'

    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/pmultiqc:0.0.39--pyhdfd78af_0' :
        'biocontainers/pmultiqc:0.0.39--pyhdfd78af_0' }"

    input:
    tuple val(meta), path(results)
    path(multiqc_config)

    output:
    tuple val(meta), path("*.html"), emit: report
    path "*.db", optional: true, emit: quantmsdb
    path "versions.yml", emit: versions
    path "*_data", emit: data

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    def config = multiqc_config ? "--config ${multiqc_config}" : ''

    """
    set -e
    multiqc \\
        --force \\
        ${args} \\
        ${config} \\
        ${results} \\
        -o .

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        pmultiqc: \$(multiqc --pmultiqc_version | sed -e "s/pmultiqc, version //g")
    END_VERSIONS
    """

    stub:
    def prefix = task.ext.prefix ?: "${meta.id}"

    """
    touch '${prefix}_multiqc_report.html'
    mkdir 'multiqc_data'

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        pmultiqc: \$(multiqc --pmultiqc_version | sed -e "s/pmultiqc, version //g")
    END_VERSIONS
    """
}
