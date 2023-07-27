FROM node:latest AS web-dist

WORKDIR /webwork

COPY . .
RUN git submodule update --init
WORKDIR /webwork/qwerty-learner
RUN yarn install
RUN yarn run build

FROM golang:latest AS build

WORKDIR /gowork

ARG GOPROXY
ARG CGO_ENABLED=0

COPY . .
COPY --from=web-dist /webwork/qwerty-learner/build server/dist

RUN echo $(git rev-parse main) >internal/version/commit

RUN go build -v -o . ./...

FROM alpine:latest

WORKDIR /app
EXPOSE 9097

ENV PATH=$PATH:/app

COPY --from=build /gowork/go-qwerty-learner .

WORKDIR /workspace