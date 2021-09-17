FROM adoptopenjdk/openjdk11:alpine-jre

RUN mkdir -p /app
WORKDIR /app
COPY . .
# Comment this if you do not have NewRelic integration
RUN wget https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && \
    unzip newrelic-java.zip -d /app    
EXPOSE 3030
CMD java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTIONS -jar /app/fuseki-server.jar