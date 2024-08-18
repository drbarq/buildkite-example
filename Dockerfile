# # Dockerfile
# FROM golang:1.18.0

# WORKDIR /app

# # Copy all files from the current directory to /app in the container
# COPY . .

# # Build the Go application
# RUN cd /app/hello_dir && go build -o ../hello_binary hello.go

# # Set the default command to run the binary
# CMD ["./hello_binary"]


# FROM golang:1.18.0

# WORKDIR /app

# # Copy all files and folders from the build context to /app
# COPY . .

# # Debug to ensure files are in place
# RUN echo "Files in /app after COPY:" && ls -R /app

# # Build the Go application
# RUN cd /app/hello_dir && go build -o ../hello_binary hello.go

# CMD ["./hello_binary"]

FROM golang:1.18.0

WORKDIR /app

# Copy all files and folders from the build context to /app
COPY . .

# Build the Go application
RUN cd /app/hello_dir && go build -o ../hello_binary hello.go

# Use ENTRYPOINT to ensure arguments are passed to the binary
# ENTRYPOINT ["./hello_binary"]

# FROM golang:1.18.0

# WORKDIR /app

# COPY hello_binary .

