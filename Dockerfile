# 使用官方 OpenJDK 作为基础镜像
FROM openjdk:17-jdk-slim

# ---- Build Stage ----
FROM gradle:8.4-jdk17 AS build
COPY --chown=gradle:gradle . /app

# 创建应用目录
WORKDIR /app
RUN gradle build --no-daemon
    
# ---- Run Stage ----
#FROM eclipse-temurin:17-jdk
#EXPOSE 8080
COPY --from=build /app/build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "/app.jar"]

#复制 jar 文件到容器中
COPY target/my-spring-app.jar app.jar

# 暴露 Spring Boot 应用监听的端口（默认是 8080）
EXPOSE 8080

# 设置容器启动命令
ENTRYPOINT ["java", "-jar", "app.jar"]