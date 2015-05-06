#!/bin/bash

branch=$(git branch | grep \* | cut -f2 -d' ')
if [ x$branch == "xmaster" ]; then branch="latest"; fi

docker push qiaoy/iobio-galaxy.bam_iobio_io:$branch
