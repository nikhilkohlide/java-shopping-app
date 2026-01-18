# Use Maven + JDK image to build inside container
FROM maven:3.9.2-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom and source
COPY pom.xml .
COPY src ./src

# Build the project and create JAR
RUN mvn clean package -DskipTests

# Second stage: minimal image with just the JAR
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/java-shopping-app-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080 



ENTRYPOINT ["java","-jar","app.jar"]


//#Use Maven + JDK image to build inside container
//FROM maven:3.9.2-eclipse-temurin-17 AS build

//WORKDIR /app


//# Copy pom and source
//COPY pom.xml .
//COPY src ./src

//# Build the project and create JAR
//RUN mvn clean package -DskipTests

//# Second stage: minimal image with just the JAR
//FROM openjdk:17-jdk-slim
//WORKDIR /app
//COPY --from=build /app/target/java-shopping-app-0.0.1-SNAPSHOT.jar app.jar

//EXPOSE 8080

//ENTRYPOINT ["java","-jar","app.jar"]
