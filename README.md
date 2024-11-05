# How to run the application

```bash
docker build -t my-spring-boot-app -f ./Dockerfile ./demo/
docker run -p 8080:8080 my-spring-boot-app
curl localhost:8080
```

# References

- Followed this tutorial (https://spring.io/guides/gs/spring-boot-docker)
