FROM golang:1.18.0

WORKDIR /app

# Copy all files and folders from the build context to /app
COPY . .

# Debug to ensure files are in place
RUN ls -R /app && cat /app/hello_dir/hello.go

# Build the Go application
RUN cd /app/hello_dir && go build -o ../hello_binary hello.go

CMD ["./hello_binary", "Buildkite"]
