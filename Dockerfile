FROM golang:1.18.0

WORKDIR /app

# Explicitly copy the hello.go file into the container
COPY hello_dir/hello.go /app/hello_dir/

# Verify the file exists in the container
RUN ls -R /app && cat /app/hello_dir/hello.go

# Build the Go application
RUN cd /app/hello_dir && go build -o ../hello_binary hello.go

CMD ["./hello_binary"]
