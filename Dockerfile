FROM tomcat:9-jre17-temurin

ENV DB_HOST="172.22.5.164" \
    DB_PORT="1433" \
    DB_USER="ubi_user" \
    DB_PASSWORD="ubi_user" \
    DB_NAME="UBI" \
    ADMIN_USER=admin \
    ADMIN_PASS=admin

ENV CATALINA_OPTS "-Xmx512M -XX:MaxPermSize=1024m"

RUN rm -rf /usr/local/tomcat/webapps/ROOT && rm -rf /usr/local/tomcat/webapps/docs
RUN mkdir -p /opt/hmcs/data/ubi/files
RUN touch /usr/local/tomcat/logs/InfoUBILog.log
ADD "deploy/UBI.war" /usr/local/tomcat/webapps/ROOT.war
ADD "deploy/UBI.war" /usr/local/tomcat/webapps/unclaimedbalancesindex.war
ADD context.xml /usr/local/tomcat/conf/context.xml
RUN addgroup --system --gid 800 customgroup \
    && adduser --system --uid 800 --ingroup customgroup --shell /bin/sh customuser

EXPOSE 5000


RUN chown -R customuser:customgroup /usr/local/tomcat/webapps/
RUN chown -R customuser:customgroup /opt/hmcs/data/ubi/files/
# Tell docker that all future commands should run as the appuser user, must use the user number
USER 800
