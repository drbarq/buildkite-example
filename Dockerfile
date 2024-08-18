FROM golang:1.18.0

WORKDIR /app

# Copy all the files into the container
COPY . .

# Verify files were copied
RUN ls -R /app && cat /app/hello_dir/hello.go

# Build the Go application
RUN cd /app/hello_dir && go build -o ../hello_binary hello.go

CMD ["./hello_binary"]
