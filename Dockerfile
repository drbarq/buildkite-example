FROM golang:1.18.0

WORKDIR /app

# Explicitly copy the hello directory
COPY hello/ /app/hello/

# Copy other files (like go.mod)
COPY . .

RUN cd hello && go build -o hello hello.go

CMD ["./hello"]
