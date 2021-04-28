FROM atsigncompany/buildimage
WORKDIR /app
COPY platform.dart .
RUN dart2native /app/platform.dart -o /app/platform

FROM subfuzion/dart:slim
COPY --from=0 /app/platform /app/platform
ENTRYPOINT ["/app/platform"]
