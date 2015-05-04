#!/bin/bash

env

CYAN='\033[1;36m'
NC='\033[0m'

cd /var/www/html
sed -i s/:8000/:$PUB_BAMTOOLS_PORT/ js/bam.iobio.js/bam.iobio.js
sed -i s/:8001/:$PUB_SAMTOOLS_PORT/ js/bam.iobio.js/bam.iobio.js
sed -i s/:8002/:$PUB_BAMDEPTHER_PORT/ js/bam.iobio.js/bam.iobio.js
sed -i s/:8003/:$PUB_BAMMERGER_PORT/ js/bam.iobio.js/bam.iobio.js
sed -i s/:8004/:$PUB_BAMSTATSALIVE_PORT/ js/bam.iobio.js/bam.iobio.js

echo ""
echo "Please point your browser to the following URL"
echo -e "${CYAN}BAM.IOBIO URL: http://${PUB_HOSTNAME}:${PUB_HTTP_PORT}/?bam=http://${PUB_HOSTNAME}:${PUB_HTTP_PORT}/tmp/bamfile.bam&region=1${NC}"
echo ""
echo ""
echo "---- start of supervisor logs ----"
echo ""

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

