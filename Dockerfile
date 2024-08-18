FROM golang:1.18.0

WORKDIR /example

COPY . .

WORKDIR /example/hello

RUN go build -o hello

CMD ["./hello"]
