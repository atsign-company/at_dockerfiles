ARG DART_VERSION="2.14.4"
FROM dart:${DART_VERSION} AS build
WORKDIR /app
COPY ./dartshowplatform/showplatform.dart .
RUN dart compile exe /app/showplatform.dart -o /app/dartshowplatform

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/dartshowplatform /app/dartshowplatform
ENTRYPOINT ["/app/dartshowplatform"]