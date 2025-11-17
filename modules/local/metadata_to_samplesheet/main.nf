process METADATA_TO_SAMPLESHEET {
    label 'process_single'

    conda "${moduleDir}/environment.yml"
    container "${workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container
        ? 'https://community-cr-prod.seqera.io/docker/registry/v2/blobs/sha256/96/96d8073cb6af1fcb6c0d1ca5e31cf18b1cdc4914e5664bb8a0b0d724d8b26e0d/data'
        : 'community.wave.seqera.io/library/grz-pydantic-models_pandas:4698df35b2af5d53'}"

    input:
    path submission_basepath

    output:
    path ("*samplesheet.csv"), emit: samplesheet

    script:
    """
    metadata_to_samplesheet.py "${submission_basepath}"
    """
}
