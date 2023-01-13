FROM tomcat:9-jdk11 as tarun
ARG branch=openmrs
RUN apt update \
    && apt install git -y \
    && apt install maven -y \
    && git clone https://github.com/tarunkumarpendem/openmrs-core.git \
    && cd openmrs-core \  
    && git checkout ${branch} \
    && mvn clean install \ 
    && cp -r /usr/local/tomcat/openmrs-core/webapp/target /usr/local/tomcat/webapps/openmrs.war 
EXPOSE 8080
CMD ["catalina.sh", "run"]    


FROM mysql:8.0.31 
ENV MYSQL_DATABASE="mysql-db"
ENV MYSQL_ROOT_PASSWORD="rootroot"
ENV MYSQL_USER="mysql-user"
ENV MYSQL_PASSWORD="mysql-password"
COPY --from=tarun /usr/local/tomcat/webapps/openmrs.war .
EXPOSE 3306
CMD [ "mysqld" ]