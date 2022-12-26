FROM tomcat:9-jdk11 as tarun
RUN apt update \
    && apt install git maven -y \
    && git clone https://github.com/tarunkumarpendem/openmrs-core.git \
    && cd openmrs-core \ 
    && mvn clean install
EXPOSE 8080
CMD ["catalina.sh", "run"]
	
	
