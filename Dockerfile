FROM golang:1.18.0

WORKDIR /app

COPY . .

RUN go build -o hello/hello ./hello/hello.go

CMD ["./hello/hello"]