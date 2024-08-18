FROM golang:1.18.0

WORKDIR /app

COPY . .

RUN cd hello && go build -o hello hello.go && mv hello ../

CMD ["./hello"]