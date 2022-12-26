FROM tomcat:9-jdk11 as tarun
RUN apt update \
    && apt install git maven -y \
    && git clone https://github.com/tarunkumarpendem/openmrs-core.git \
    && cd openmrs-core \  
    && mvn clean install \ 
    && cp /usr/local/tomcat/openmrs-core/webapp/target /usr/local/tomcat/webapps/openmrs.war 
EXPOSE 8080
CMD ["catalina.sh", "run"]    