mkdir -p /appdata/amct/sourceFile/java
cp /appdata/tomcat/webapps/amct/java/entity/* /appdata/amct/sourceFile/java/
cp /appdata/tomcat/webapps/amct/menu/* /appdata/amct/sourceFile/jsp/
cp /appdata/tomcat/webapps/amct/WEB-INF/classes/mapper/* /appdata/amct/sourceFile/mapper/

sleep 1

javac -d /appdata/tomcat/webapps/amct/WEB-INF/classes -encoding utf-8 -cp /appdata/amct/java/jar/spring-beans-3.2.4.RELEASE.jar:/appdata/amct/java/jar/mybatis-3.2.4.jar:/appdata/amct/java/jar/spring-context-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-test-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-tx-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-web-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-webmvc-3.2.4.RELEASE.jar /appdata/amct/java/findListDto.java /appdata/tomcat/webapps/amct/java/entity/*.java