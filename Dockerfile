# 使用官方 OpenJDK 作为基础镜像
FROM openjdk:17-jdk-slim

# 创建应用目录
WORKDIR /app

# 复制 jar 文件到容器中
COPY target/my-spring-app.jar app.jar

# 暴露 Spring Boot 应用监听的端口（默认是 8080）
EXPOSE 8080

# 设置容器启动命令
ENTRYPOINT ["java", "-jar", "app.jar"]