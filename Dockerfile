FROM golang:1.18.0

WORKDIR /app

# Copy the hello.go file directly
COPY hello_dir/hello.go /app/hello_dir/

# Simple command to check if hello.go is present
CMD ["ls", "-R", "/app"]
