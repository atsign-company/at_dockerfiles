ARG IMAGE_TAG="automated"
FROM atsigncompany/buildimage:$IMAGE_TAG
WORKDIR /app
COPY ./dartshowplatform/showplatform.dart .
RUN dart compile exe /app/showplatform.dart -o /app/dartshowplatform

FROM atsigncompany/runimage:$IMAGE_TAG
COPY --from=0 /app/dartshowplatform /app/dartshowplatform
ENTRYPOINT ["/app/dartshowplatform"]
