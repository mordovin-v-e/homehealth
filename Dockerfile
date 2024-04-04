# cache gradle dependencies
FROM gradle:8.7.0 AS gradle_cache
WORKDIR /home/gradle/app
ENV GRADLE_USER_HOME /cache
COPY build.gradle.kts settings.gradle.kts ./
RUN gradle --refresh-dependencies

# build application
FROM gradle:8.7.0-jdk21-alpine AS builder
COPY --from=gradle_cache /cache /home/gradle/.gradle
WORKDIR /usr/app/
COPY . .
RUN gradle clean build

# runtime
FROM openjdk:21-slim
COPY --from=builder /usr/app/build/libs/homehealth.jar app.jar
EXPOSE 8000
ENTRYPOINT ["java","-jar","app.jar"]