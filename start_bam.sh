#!/bin/bash
#
# Example script to launch the container while providing
# the to-be-visualized bam file on the commandline

# The following env vars will be honored by the container startup script

export PUB_HOSTNAME=$(hostname -f)
export PUB_HTTP_PORT=8080

# Launch the container

docker run -it \
	-p $PUB_HTTP_PORT:80 \
	-v ${1}:/input/bamfile.bam:ro \
	-v ${1}.bai:/input/bamfile.bam.bai:ro \
	-e PUB_HOSTNAME \
	-e PUB_HTTP_PORT \
	--rm qiaoy/iobio-galaxy.bam_iobio_io
