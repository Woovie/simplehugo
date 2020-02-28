FROM golang as builder
RUN apt install git
RUN mkdir -p /root/src
WORKDIR /root/src
RUN git clone https://github.com/gohugoio/hugo.git
WORKDIR /root/src/hugo
RUN go install --tags extended

FROM ubuntu:latest
COPY --from=builder /go/bin/hugo /bin
