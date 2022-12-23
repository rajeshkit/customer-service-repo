FROM openjdk:17
COPY ./target/customer-service.jar customer-service.jar
CMD ["java","-jar","customer-service.jar"]