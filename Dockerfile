FROM gradle:8.5-jdk17 AS builder
WORKDIR /todo
COPY build.gradle settings.gradle /todo/
COPY src /todo/src
RUN gradle clean bootJar --no-daemon

FROM openjdk:17-slim
WORKDIR /todo
COPY --from=builder /todo/build/libs/*.jar ./app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]