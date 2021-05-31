sudo su
sudo apt update -y
sudo systemctl status apache2
dpkg --get-selections | grep apache
sudo apt install apache2
sudo systemctl status apache2
cd /var/log/apache2
ls
tar -cvf hamritha-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar access.log error.log
#cd /var/log/apache2/tmp
tar -xf hamritha-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar -C /tmp 
aws s3\
	cp /tmp/hamritha-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar \
	s3://upgrad-hamritha/hamritha-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar
sudo su
cd /root
#Bookkeeping
cd /var/www/html/
ls
#check whether inventory.html file is present or not, if not create one
touch inventory.html
echo "Log type  \tDate created  \tTime   \tSize"
Date created =$(date '+%d%m%Y')
Time=$(date '%H%MS')
Size=du -sh automation.sh


#create cron job
#open crontab file
apt install cron
cd /etc/cron.d
ls
#create a file named automation
touch automation
#edit the file to schedule task
vi automation
0 3 * * * /root/Automation_project/automation.sh

