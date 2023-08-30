# Stage 1: Build the application
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app

# Copy the project files and build the application
COPY pom.xml .
COPY src ./src
RUN mvn test clean package

FROM adoptopenjdk:11-jre-hotspot
COPY --from=build /app/target/*.jar .
CMD ["java", "-jar", "/app.jar"]
