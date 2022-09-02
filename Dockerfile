# this stage starts fresh with a minimal debian image and only copying over the jar
#### prod slim
FROM openjdk:11-jre-slim as prod
# we have to remake the java user again in this new base image
#RUN groupadd --gid 1000 java \
  #&& useradd --uid 1000 --gid java --shell /bin/bash --create-home java
#USER java
#VOLUME /tmp
#WORKDIR /spring-petclinic-1
#COPY --from=build --chown=java:java /spring-petclinic-1/target/petclinic.jar /spring-petclinic-1/petclinic.jar
# To reduce Tomcat startup time we added a system property pointing to "/dev/urandom" as a source of entropy.
COPY target/spring-petclinic-2.7.0-SNAPSHOT.jar spring-petclinic-2.7.0-SNAPSHOT.jar
CMD ["java","-jar","/spring-petclinic-2.7.0-SNAPSHOT.jar"]
