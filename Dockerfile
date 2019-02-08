FROM tomcat:8.0.43-jre8

ENV DB_HOST="172.22.5.164" \
    DB_PORT="1433" \
    DB_USER="ubi_user" \
    DB_PASSWORD="ubi_user" \
    DB_NAME="UBI" \
    ADMIN_USER=admin \
    ADMIN_PASS=admin

ENV CATALINA_OPTS "-Xmx512M -XX:MaxPermSize=1024m"

RUN rm -rf /usr/local/tomcat/webapps/ROOT

ADD "deploy/UBI.war" /usr/local/tomcat/webapps/ROOT.war
ADD context.xml /usr/local/tomcat/conf/context.xml
