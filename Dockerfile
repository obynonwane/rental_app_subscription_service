
# base go image - for production 
FROM --platform=linux/amd64 alpine:latest

RUN mkdir /app

COPY subscriptionApp /app

CMD [ "/app/subscriptionApp" ]


# base go image - for development 

# FROM golang:1.21-alpine as builder

# RUN mkdir /app

# COPY . /app

# WORKDIR /app

# RUN CGO_ENABLED=0 go build -o subscriptionApp ./cmd/api

# RUN chmod +x /app/subscriptionApp

# # build a tiny docker image

# FROM alpine:latest

# RUN mkdir /app

# COPY --from=builder /app/subscriptionApp /app

# CMD [ "/app/subscriptionApp" ]



