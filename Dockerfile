FROM qiaoy/iobio-galaxy.bam_iobio_io.base
MAINTAINER Yi Qiao <atrusqiao@gmail.com>

COPY supervisord.conf /etc/supervisor/
COPY nginx-sites-default /etc/nginx/sites-available/default
COPY app.conf /etc/supervisor/conf.d/
COPY entrypoint.sh /
COPY watchdog.sh /
RUN chmod +x /entrypoint.sh && \
	chmod +x /watchdog.sh && \
	mkdir /input && \
	mkdir /var/www/html/tmp && \
	ln -s /input/bamfile.bam /var/www/html/tmp/bamfile.bam && \
	ln -s /input/bamfile.bam.bai /var/www/html/tmp/bamfile.bam.bai && \
	ln -s /input/bamfile.bam.bai /home/iobio/workdir/bamfile.bam.bai

EXPOSE 80 8000 8001 8002 8003 8004

CMD ["/bin/sh", "-c", "/entrypoint.sh"]
