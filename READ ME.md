# SuperiorOAS

## Introduction

* Spring boot + mybatis + jsp

* Spring boot version :: Spring Boot :: (v2.7.17)

* Mysql properties

  ```java
  #driver
  spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
  #which database
  spring.datasource.url=jdbc:mysql://localhost:3306/SuperiorOAS
  #account
  spring.datasource.username=root
  #password
  spring.datasource.password=12345678
  
  mybatis.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl
  #convert a_column ---> aColumn
  mybatis.configuration.map-underscore-to-camel-case=true
  logging.level.org.springframework.security=DEBUG
  ```