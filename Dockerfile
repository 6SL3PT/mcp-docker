# Stage 1: Build the Go application
FROM golang:1.24-bullseye as builder

# Set the working directory
WORKDIR /app

COPY go.mod go.sum .

# Download dependencies
RUN go mod download

# Copy the Go source code
COPY . .

# Build the Go binary (you can change the name of the binary as needed)
RUN go build -o mcp-cli .

# Stage 2: Create the final image
FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    python3 \
    python3-pip \
    nodejs \
    npm \
    && pip3 install uv \
    && npm install -g npx \
    && apt-get clean

# Set the working directory in the container
WORKDIR /root/

# Copy the compiled Go binary from the builder stage
COPY --from=builder /app/mcp-cli .

# Set the entrypoint to the built Go binary
ENTRYPOINT ["/root/mcp-cli"]
