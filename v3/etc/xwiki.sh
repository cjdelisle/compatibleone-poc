#!/bin/bash

# This is the startup script that is used to start the XWiki service via COSACS once the XWiki machine is started.
# The prerequisite is that the JDK and XWiki are installed under /opt/jdk and /opt/xwiki
export PATH=/opt/jdk/bin:$PATH
export JAVA_HOME=/opt/jdk

# The $database_mysql_hostname is automatically bound to the IP address of the machine containing the MySQL server.
# We use this address to initialize the XWiki database.
mysql -u root --password=root -h $database_mysql_hostname -e "drop database if exists xwiki; create database xwiki"
mysql -u root --password=root -h $database_mysql_hostname xwiki < /root/xwiki.sql

# In the XWiki Hibernate configuration file we replace the ##DBHOST## placeholder using the IP address of the MySQL server, so that XWiki can correctly communicate with it.
sed "s/##DBHOST##/$database_mysql_hostname/" < /opt/xwiki/webapps/xwiki/WEB-INF/hibernate.cfg.xml.template  > /opt/xwiki/webapps/xwiki/WEB-INF/hibernate.cfg.xml

# We finally start the XWiki server.
exec /opt/xwiki/start_xwiki.sh
