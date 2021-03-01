# DistributedTracing-Example

Demonstrates the usage of opentracing API implementation Jaeger for distributed tracing.

Original Example: [yandok/DistributedTracing-Example](https://github.com/yandok/DistributedTracing-Example)

## Start the Jeager-Stack on the local docker-compose

```
docker-compose up -d
```

Open in browser [http://localhost:16686/](http://localhost:16686/)

## Build and run example apps

works good only with java8

```
cd appA
mvn clean package
java -jar target/OpenTracing-AppA-0.1-SNAPSHOT.jar
```

And the same for appB

## Create test requests

Open in browser [http://localhost:8080/greeting](http://localhost:8080/greeting)

and [http://localhost:9080/greeting](http://localhost:9080/greeting)

## Find traces in Jager