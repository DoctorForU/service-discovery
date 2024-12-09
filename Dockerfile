# Base image 설정
FROM openjdk:21-jdk-slim

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 소스 복사
COPY . .

# Gradle 빌드 수행 (테스트 제외)
RUN ./gradlew clean build -x test

# 빌드된 JAR 파일 복사
COPY . .

# JAR 파일 실행 설정
ENTRYPOINT ["java", "-jar", "/usr/src/app/service-discovery.jar"]
