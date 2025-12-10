process EXAMPLE {
    tag "$meta.id"
    label 'process_low'

    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/your-tool:version' :
        'biocontainers/your-tool:version' }"

    input:
    tuple val(meta), path(input_file)

    output:
    tuple val(meta), path("*.output"), emit: output
    path "versions.yml"              , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    # Example command
    echo "Processing ${input_file}" > ${prefix}.output

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        example: \$(echo "1.0.0")
    END_VERSIONS
    """

    stub:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    touch ${prefix}.output

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        example: \$(echo "1.0.0")
    END_VERSIONS
    """
}
