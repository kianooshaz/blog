FROM alpine:3.19 AS prerequisite

RUN apk add --no-cache tzdata
RUN apk add --no-cache bash
RUN apk add --update hugo

ENV TZ=Asia/Tehran

WORKDIR /opt/HugoApp

COPY . .

RUN hugo

FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html

COPY --from=build /opt/HugoApp/public .

EXPOSE 80/tcp
