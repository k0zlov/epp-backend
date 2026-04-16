FROM dart:stable AS build

WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart run ruta_cli build

RUN dart compile exe .ruta/server.dart -o /app/server

FROM scratch

COPY --from=build /runtime/ /
COPY --from=build /app/server /app/server

EXPOSE 8080

ENTRYPOINT ["/app/server"]