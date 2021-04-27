FROM google/dart
WORKDIR /app
COPY lscpu.dart .
RUN dart2native lscpu.dart -o /app/bin/dlscpu

FROM subfuzion/dart:slim
COPY --from=0 /app/bin/dlscpu
ENTRYPOINT ["/app/bin/dlscpu"]