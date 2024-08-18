FROM golang:1.18.0

WORKDIR /app

COPY . .

# Navigate to the hello directory and build the Go application
RUN cd hello && go build -o hello hello.go

# Move the compiled binary to the /app directory
RUN mv hello /app/

CMD ["./hello"]
