# FROM maven:3-jdk-11 as build
# RUN git clone https://github.com/tarunkumarpendem/openmrs-core.git && \
#     cd openmrs-core && \
#     mvn package


# FROM tomcat:8-jdk11
# LABEL app="openmrs"
# LABEL author="Tarun"
# COPY --from=build /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
# EXPOSE 8080
# CMD ["catalina.sh", "run"]



# FROM maven:3-jdk-11 as build
# ARG branch=openmrs
# RUN git clone https://github.com/tarunkumarpendem/openmrs-core.git && \
#     cd openmrs-core && \
#     git checkout ${branch} && \
#     mvn package

# war file location: /openmrs-core/webapp/target/openmrs.war
# FROM tomcat:8-jdk11
# ENV MYSQL_DATABASE="mysql-db"
# ENV MYSQL_ROOT_PASSWORD="rootroot"
# ENV MYSQL_USER="mysql-user"
# ENV MYSQL_PASSWORD="mysql-password"
# LABEL application="openmrs"
# LABEL owner="Tarun"
# COPY --from=build /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
# EXPOSE 8080
# CMD ["catalina.sh", "run"]






FROM maven:3.8.3-openjdk-11 as build
LABEL author="Tarun"
LABEL application="openmrs"
LABEL tech="java-11"
# ARG branch=openmrs
# git checkout ${branch} && \
RUN git clone https://github.com/tarunkumarpendem/openmrs-core.git && \
    cd openmrs-core && \
   # git checkout ${branch} && \
    mvn clean package
EXPOSE 8080


FROM tomcat:8.5.93-jdk11
COPY --from=build /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]
WORKDIR /openmrs-core