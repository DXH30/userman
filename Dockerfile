FROM openjdk:17-buster

COPY . /app

WORKDIR /app

RUN ./mvnw clean install

CMD ["./mvnw", "spring-boot:run"]
