FROM golang:1.18.0

WORKDIR /app

# Build the Go application
CMD ["sh", "-c", "cd /app/hello_dir && go build -o ../hello_binary hello.go && ../hello_binary 'Buildkite'"]
