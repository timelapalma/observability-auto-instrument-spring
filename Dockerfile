FROM openjdk:21-jdk
ADD build/target/observability-auto.jar /observability-auto.jar
ADD build/target/opentelemetry-javaagent-2.1.0.jar /opentelemetry-javaagent.jar

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://host.docker.internal:4318

ENTRYPOINT java -javaagent:/opentelemetry-javaagent.jar \
                -Dotel.traces.exporter=otlp \
                -Dotel.metrics.exporter=otlp \
                -Dotel.logs.exporter=otlp \
                -Dotel.exporter.otlp.endpoint=${OTEL_EXPORTER_OTLP_ENDPOINT} \
                -Dotel.service.name=sample-service \
                -jar /observability-auto.jar