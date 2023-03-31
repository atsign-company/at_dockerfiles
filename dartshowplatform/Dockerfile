FROM atsigncompany/buildimage:automated AS build
WORKDIR /app
COPY ./dartshowplatform/showplatform.dart .
RUN dart compile exe /app/showplatform.dart -o /app/dartshowplatform

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/dartshowplatform /app/dartshowplatform
ENTRYPOINT ["/app/dartshowplatform"]