# GitBlue - Crystal + Lucky + Pico Blue - CapRover ready

FROM crystallang/crystal:1.12.3-alpine AS builder
WORKDIR /app
RUN apk add --no-cache yaml-static yaml-dev libxml2-dev \
    openssl-dev openssl-libs-static zlib-static \
    musl-dev gc-dev libevent-dev pcre2-dev postgresql-dev git

COPY shard.yml shard.lock ./
RUN shards install --production --ignore-crystal-version
COPY . .
RUN crystal build src/gitblue_website.cr --release --static --no-debug -o /app/gitblue_website

FROM alpine:3.19
RUN apk add --no-cache tzdata libpq libyaml libevent pcre2 gc libxml2
WORKDIR /app
COPY --from=builder /app/gitblue_website ./gitblue_website
COPY --from=builder /app/public ./public
COPY --from=builder /app/db ./db

ENV LUCKY_ENV=production
ENV PORT=3000
EXPOSE 3000
CMD ["./gitblue_website"]
