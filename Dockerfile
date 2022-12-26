FROM tomcat:9-jdk11 as tarun
RUN apt update \
    && apt install git maven -y \
    && git clone https://github.com/tarunkumarpendem/openmrs-core.git \
    && cd openmrs-core
ARG branch=openmrs
RUN git checkout ${branch} \    
    && mvn clean install 
    # && cp cp /usr/local/tomcat/openmrs/gameoflife-web/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war 