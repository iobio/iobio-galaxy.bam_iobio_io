#!/bin/bash
#
# Example script to launch the container while providing
# the directory containing the to-be-visualized bam file 
# on the commandline

# The following env vars will be honored by the container startup script

export PUB_HOSTNAME=$(hostname -f)
export PUB_HTTP_PORT=8080
export PUB_BAMTOOLS_PORT=5000
export PUB_SAMTOOLS_PORT=5001
export PUB_BAMDEPTHER_PORT=5002
export PUB_BAMMERGER_PORT=5003
export PUB_BAMSTATSALIVE_PORT=5004

# Launch the container

docker run -it \
	-p $PUB_HTTP_PORT:80 \
	-p $PUB_BAMTOOLS_PORT:8000 \
	-p $PUB_SAMTOOLS_PORT:8001 \
	-p $PUB_BAMDEPTHER_PORT:8002 \
	-p $PUB_BAMMERGER_PORT:8003 \
	-p $PUB_BAMSTATSALIVE_PORT:8004 \
	-v ${1}:/input/:ro \
	-e PUB_HOSTNAME=$(hostname -f) \
	-e PUB_HTTP_PORT \
	-e PUB_BAMTOOLS_PORT \
	-e PUB_SAMTOOLS_PORT \
	-e PUB_BAMDEPTHER_PORT \
	-e PUB_BAMMERGER_PORT \
	-e PUB_BAMSTATSALIVE_PORT \
	--rm qiaoy/iobio-galaxy.bam_iobio_io
