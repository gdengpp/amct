#先创建目录-p确保目录名称存在，不存在的就建一个
mkdir -p /appdata/tomcat/webapps/amct/java/entity
mkdir -p /appdata/tomcat/webapps/amct/menu

#重新部署1、复制增加的信息到对应位置；2、编译源文件；3、重新启动tomcat
cp /appdata/amct/sourceFile/java/* /appdata/tomcat/webapps/amct/java/entity/
cp /appdata/amct/sourceFile/jsp/* /appdata/tomcat/webapps/amct/menu/
cp /appdata/amct/sourceFile/mapper/* /appdata/tomcat/webapps/amct/WEB-INF/classes/mapper/

sleep 1

javac -d /appdata/tomcat/webapps/amct/WEB-INF/classes -encoding utf-8 -cp /appdata/amct/java/jar/spring-beans-3.2.4.RELEASE.jar:/appdata/amct/java/jar/mybatis-3.2.4.jar:/appdata/amct/java/jar/spring-context-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-test-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-tx-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-web-3.2.4.RELEASE.jar:/appdata/amct/java/jar/spring-webmvc-3.2.4.RELEASE.jar /appdata/amct/java/findListDto.java /appdata/tomcat/webapps/amct/java/entity/*.java

sleep 1

/appdata/tomcat/bin/shutdown.sh
sleep 2
/appdata/tomcat/bin/startup.sh
