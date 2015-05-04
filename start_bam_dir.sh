#!/bin/bash

export PUB_HTTP_PORT=8080
export PUB_BAMTOOLS_PORT=5000
export PUB_SAMTOOLS_PORT=5001
export PUB_BAMDEPTHER_PORT=5002
export PUB_BAMMERGER_PORT=5003
export PUB_BAMSTATSALIVE_PORT=5004

docker run -it \
	-p $PUB_HTTP_PORT:80 \
	-p $PUB_BAMTOOLS_PORT:8000 \
	-p $PUB_SAMTOOLS_PORT:8001 \
	-p $PUB_BAMDEPTHER_PORT:8002 \
	-p $PUB_BAMMERGER_PORT:8003 \
	-p $PUB_BAMSTATSALIVE_PORT:8004 \
	-v ${1}:/input/bamfile.bam:ro \
	-v ${1}.bai:/input/bamfile.bam.bai:ro \
	-e PUB_HOSTNAME=$(hostname -f) \
	-e PUB_HTTP_PORT \
	-e PUB_BAMTOOLS_PORT \
	-e PUB_SAMTOOLS_PORT \
	-e PUB_BAMDEPTHER_PORT \
	-e PUB_BAMMERGER_PORT \
	-e PUB_BAMSTATSALIVE_PORT \
	--rm qiaoy/iobio-galaxy.bam_iobio_io
