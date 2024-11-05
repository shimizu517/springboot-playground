# Define a base image with Java installed
FROM openjdk:21-slim

# Set working directory
WORKDIR /app

# Copy the Maven wrapper and pom.xml files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Install Maven dependencies (this layer will be cached if pom.xml hasn't changed)
RUN ./mvnw dependency:go-offline

# Copy the rest of the project files
COPY src ./src

# Build the application
RUN ./mvnw package

# Expose the port
EXPOSE 8080

# Add a non-root user and switch to that user
RUN addgroup --system spring && adduser --system --ingroup spring spring
USER spring:spring

# Run the JAR
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
