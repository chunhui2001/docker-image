### 项目地址
https://github.com/naver/pinpoint.git

列出所有 tag
git tag
git checkout tag_name_here

### Quick Overview
# HBase (details)
	Set up HBase cluster - Apache HBase
	Create HBase Schemas - feed /scripts/hbase-create.hbase to hbase shell.
# Build Pinpoint (Optional) - You do not need to build from source to use Pinpoint (binaries here).
	Clone Pinpoint - git clone $PINPOINT_GIT_REPOSITORY
	Set JAVA_HOME environment variable to JDK 8 home directory.
	Set JAVA_6_HOME environment variable to JDK 6 home directory (1.6.0_45 recommended).
	Set JAVA_7_HOME environment variable to JDK 7 home directory (1.7.0_80 recommended).
	Set JAVA_8_HOME environment variable to JDK 8 home directory.
	Run ./mvnw clean install -Dmaven.test.skip=true (or ./mvnw.cmd for Windows)
# Pinpoint Collector (details)
	Deploy pinpoint-collector-$VERSION.war to a web container.
	Configure pinpoint-collector.properties, hbase.properties.
	Start container.
# Pinpoint Web (details)
	Deploy pinpoint-web-$VERSION.war to a web container as a ROOT application.
	Configure pinpoint-web.properties, hbase.properties.
	Start container.
# Pinpoint Agent (details)
	Extract/move pinpoint-agent/ to a convenient location ($AGENT_PATH).
	Set -javaagent:$AGENT_PATH/pinpoint-bootstrap-$VERSION.jar JVM argument to attach the agent to a java application.
	Set -Dpinpoint.agentId and -Dpinpoint.applicationName command-line arguments.
	Launch java application with the options above.


export JAVA_8_HOME=$(/usr/libexec/java_home)
