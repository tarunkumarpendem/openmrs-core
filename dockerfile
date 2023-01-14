FROM maven:3-jdk-8 as build
RUN git clone https://github.com/tarunkumarpendem/openmrs-core.git && \
    cd openmrs-core && \
    mvn package

# Dockerfile ,,,Openmrs run i,e stage-2
#war file location: /openmrs-core/webapp/target/openmrs.war
FROM tomcat:8-jdk11
LABEL application="openmrs"
LABEL owner="me"
COPY --from=build /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]