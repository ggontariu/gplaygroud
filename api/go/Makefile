# Makefile for building and running the Go API Docker container

# Variables
IMAGE_NAME = go-api
CONTAINER_NAME = go-api-container
PORT = 8080

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) -f api/go/Dockerfile .

# Run the container
run:
	docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Stop the container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# Clean up images
clean:
	docker rmi $(IMAGE_NAME)

# Build and run
up: build run

# Stop and clean
down: stop clean

.PHONY: build run stop clean up down
