FROM atsigncompany/buildimage:automated
WORKDIR /app
COPY ./dartshowplatform/showplatform.dart .
RUN dart compile exe /app/showplatform.dart -o /app/dartshowplatform

FROM atsigncompany/runimage:automated
COPY --from=0 /app/dartshowplatform /app/dartshowplatform
ENTRYPOINT ["/app/dartshowplatform"]
