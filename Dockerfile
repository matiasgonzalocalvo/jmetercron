FROM openjdk:slim-buster
#FROM adoptopenjdk/openjdk11:debian-slim
ENV JEMETER_VERSION 5.3
ENV WORKDIR jmeter
WORKDIR /${WORKDIR}
RUN apt update ; apt install wget -y
RUN java -version
#RUN ip r 
#RUN echo "nameserver 127.0.0.1" > /etc/resolv.conf  
RUN wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-${JEMETER_VERSION}.tgz
RUN tar -xf apache-jmeter-${JEMETER_VERSION}.tgz && rm apache-jmeter-${JEMETER_VERSION}.tgz
ENV JMETER_HOME=/${WORKDIR}/apache-jmeter-${JEMETER_VERSION}
ENV PATH=$JMETER_HOME/bin:$PATH
RUN cd /${WORKDIR}/apache-jmeter-${JEMETER_VERSION}/lib/ext && wget https://github.com/NovatecConsulting/JMeter-InfluxDB-Writer/releases/download/v-1.2/JMeter-InfluxDB-Writer-plugin-1.2.jar 
RUN chmod 755 /${WORKDIR}/apache-jmeter-5.3 -R
RUN apt install python3-pip -y 
RUN pip3 install -r requirements.txt
CMD ["sleep", "60000"]
