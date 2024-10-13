# Laboratório usando Open Telemetry para coletar métricas e spanmetrics de uma app Java

Ref.: https://medium.com/@ahmadalammar/simplifying-spring-observability-with-opentelemetry-auto-instrumentation-and-java-agent-part-1-ef163f4125e3


## Build:
Build da app de testes via maven:

```sh
cd observability-auto-spring/build
mvn clean package
```

## Confinando a app em Docker:

```sh
cd ..
docker build --tag=observability-auto-spring:latest .
docker run -p 8080:8080 \
    -e OTEL_EXPORTER_OTLP_ENDPOINT="http://host.docker.internal:4318" \
    -d observability-auto-spring:latest --network host
```

> A partir da execução verifique se a aplicação está escutando na porta 8080 nas paths "/", e "/actuator/health"

## Configurando a stack do Opentelemetry:


A partir da raiz do projeto inicialize a stack de observability para os testes:

```sh
docker-compose up
```

> Mnatenha a execução em foreground (omitindo o parâmetro "-d") para acompanhar o processo de ingestão dos spans enviados pela app

---