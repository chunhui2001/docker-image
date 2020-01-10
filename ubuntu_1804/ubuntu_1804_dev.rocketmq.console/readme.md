# git clone https://github.com/apache/rocketmq-externals.git
# cd rocketmq-externals/rocketmq-console
# cp rocketmq-externals/rocketmq-console/src/main/resources/application.properties
# mvn clean package -Dmaven.test.skip=true
# java -jar rocketmq-console-ng-1.0.1.jar


### SpringBoot 由 jar 包转换为 war 包
<packaging>jar</packaging> to <packaging>war</packaging>

### 移除内嵌的 tomcat 模块，但是为了我们在本机测试方便，我们还需要引入它，所以配置如下
<dependency>  
    <groupId>org.springframework.boot</groupId>  
    <artifactId>spring-boot-starter-web</artifactId>  
    <exclusions>  
        <exclusion>  
            <groupId>org.springframework.boot</groupId>  
            <artifactId>spring-boot-starter-tomcat</artifactId>  
        </exclusion>  
    </exclusions>  
</dependency>  
<dependency>  
    <groupId>org.springframework.boot</groupId>  
    <artifactId>spring-boot-starter-tomcat</artifactId>  
    <scope>provided</scope>  
</dependency>  

### 添加tomcat-servelt-api依赖
<dependency>  
    <groupId>org.apache.tomcat</groupId>  
    <artifactId>tomcat-servlet-api</artifactId>  
    <version>7.0.42</version>  
    <scope>provided</scope>  
</dependency> 

### 修改入口方法 继承一个 SpringBootServletInitializer 类，并且覆盖 configure 方法
>>>> package com.example;  
>>>> 
>>>> import org.springframework.boot.SpringApplication;  
>>>> import org.springframework.boot.autoconfigure.SpringBootApplication;  
>>>> import org.springframework.boot.builder.SpringApplicationBuilder;  
>>>> import org.springframework.boot.web.support.SpringBootServletInitializer;  
>>>> import org.springframework.cache.annotation.EnableCaching;  
>>>> 
>>>> @SpringBootApplication  
>>>> @EnableCaching  
>>>> public class SpringDataJpaExampleApplication extends SpringBootServletInitializer {  
>>>> 
>>>>     @Override  
>>>>     protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {  
>>>>         return application.sources(SpringDataJpaExampleApplication.class);  
>>>>     }  
>>>> 
>>>>     public static void main(String[] args) {  
>>>>         SpringApplication.run(SpringDataJpaExampleApplication.class, args);  
>>>>     }  
>>>> }

### 添加war插件，用来自定义打包以后的war包的名称
<plugin>  
    <groupId>org.apache.maven.plugins</groupId>  
    <artifactId>maven-war-plugin</artifactId>  
    <configuration>  
        <warSourceExcludes>src/main/resources/**</warSourceExcludes>  
        <warName>springBoot</warName>  
    </configuration>  
</plugin>  
