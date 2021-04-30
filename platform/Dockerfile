FROM atsigncompany/buildimage:test
WORKDIR /app
COPY ./platform/platform.dart .
RUN dart2native /app/platform.dart -o /app/platform

FROM atsigncompany/runimage:test
COPY --from=0 /app/platform /app/platform
ENTRYPOINT ["/app/platform"]
