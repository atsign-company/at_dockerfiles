FROM atsigncompany/buildimage
WORKDIR /app
COPY ./dartshowplatform/showplatform.dart .
RUN dart compile exe /app/showplatform.dart -o /app/dartshowplatform

FROM atsigncompany/runimage
COPY --from=0 /app/dartshowplatform /app/dartshowplatform
ENTRYPOINT ["/app/dartshowplatform"]
