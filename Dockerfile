# ===== 1. Build stage =====
FROM gradle:8.4-jdk17 AS build
WORKDIR /app

# Copy Gradle project files
COPY . .

# Build the project (this will generate the .jar in build/libs)
RUN gradle clean build --no-daemon

# ===== 2. Runtime stage =====
FROM eclipse-temurin:17-jdk AS runtime
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]