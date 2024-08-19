
FROM golang:1.18.0

WORKDIR /app

# Copy all files and folders from the build context to /app
COPY . .

# Build the Go application
RUN cd /app/hello_dir && go build -o /app/hello_binary hello.go

# Use ENTRYPOINT to ensure arguments are passed to the binary
ENTRYPOINT ["./hello_binary"]

