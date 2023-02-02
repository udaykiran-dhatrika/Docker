FROM maven:3.8.6-openjdk-8 as build
RUN git clone https://github.com/udaykiran-dhatrika/game-of-life.git && \
	cd game-of-life && \
	mvn package
	
FROM tomcat:8-jdk8
LABEL application="gameoflife"
LABEL owner=udaykiran"
COPY --from=build /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
