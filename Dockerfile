FROM openjdk:17
# 프로젝트를 복사해서 도커 파일 안에서
# 빌드를  치고 그 후에 jar 실행 시킨다
RUN ["mkdir", "project"]
COPY . ./project
RUN["chmod", "744","./project/gradlew"]
RUN ["./project/gradlew", "clean", "build"]
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=prod","project/build/lib/*T.jar"]