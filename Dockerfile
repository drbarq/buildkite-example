FROM golang:1.18.0

WORKDIR /app

# Copy everything into /app in the container
COPY . .

# Build the Go application
RUN cd hello_dir && go build -o ../hello_binary hello.go

CMD ["./hello_binary"]
