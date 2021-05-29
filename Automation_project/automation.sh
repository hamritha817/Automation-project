sudo su
sudo apt update -y
sudo apt install apache2
systemctl status apache2
cd /var/log/apache2
ls5
tar -cvf hamritha-httpd-access-$(date '+%d%m%Y-%H%M%S').tar access.log
tar -cvf hamritha-httpd-error-$(date '+%d%m%Y-%H%M%S').tar error.log
aws s3\
	cp /apache2/hamritha-httpd-access-$(date '+%d%m%Y-%H%M%S').tar \
	cp /apache2/hamritha-httpd-error-$(date '+%d%m%Y-%H%M%S').tar \
	s3://upgrad-hamritha/hamritha-httpd-access-$(date '+%d%m%Y-%H%M%S').tar
	s3://upgrad-hamritha/hamritha-httpd-error-$(date '+%d%m%Y-%H%M%S').tar

