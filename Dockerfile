FROM golang:1.18.0

WORKDIR /app

# Copy all the files into the container
COPY . .

# Move into the hello_dir directory and build the Go binary
RUN cd hello_dir && go build -o ../hello_binary hello.go

CMD ["./hello_binary"]
