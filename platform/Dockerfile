FROM atsigncompany/buildimage
WORKDIR /app
COPY ./platform/platform.dart .
RUN dart2native /app/platform.dart -o /app/platform

FROM atsigncompany/runimage
COPY --from=0 /app/platform /app/platform
ENTRYPOINT ["/app/platform"]
