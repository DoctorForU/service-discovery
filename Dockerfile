# Base image 설정
FROM openjdk:21-jdk-slim

# 작업 디렉토리 설정
WORKDIR /usr/src/app

ARG JAR_PATH=./build/libs

# 소스 복사
COPY ${JAR_PATH}/servicediscovery-0.0.1-SNAPSHOT.jar ${JAR_PATH}/servicediscovery-0.0.1-SNAPSHOT.jar

# Gradle 빌드 수행 (테스트 제외)
RUN ./gradlew clean build -x test

# JAR 파일 실행 설정
ENTRYPOINT ["java", "-jar", "./build/libs/servicediscovery-0.0.1-SNAPSHOT.jar"]
