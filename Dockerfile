FROM maven:3-jdk-11 as build
ARG branch=openmrs
RUN git clone https://github.com/tarunkumarpendem/openmrs-core.git && \
    cd openmrs-core && \
    git checkout ${branch} && \
    mvn package

#war file location: /openmrs-core/webapp/target/openmrs.war
FROM tomcat:8-jdk11
ENV MYSQL_DATABASE="mysql-db"
ENV MYSQL_ROOT_PASSWORD="rootroot"
ENV MYSQL_USER="mysql-user"
ENV MYSQL_PASSWORD="mysql-password"
LABEL application="openmrs"
LABEL owner="Tarun"
COPY --from=build /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]