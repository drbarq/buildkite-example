FROM golang:1.18.0

WORKDIR /app

# Commenting out these steps for testing
# RUN ls -R /app && cat /app/hello_dir/hello.go

# Build the Go application
CMD ["sh", "-c", "cd /app/hello_dir && go build -o ../hello_binary hello.go && ../hello_binary"]
