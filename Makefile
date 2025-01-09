.PHONY: build up down logs clean test terraform-init terraform-plan terraform-apply terraform-destroy

# Default target
all: build up

# Build Docker images
build:
	docker-compose build

# Start containers
up:
	docker-compose up -d

# Stop containers
down:
	docker-compose down

# View logs
logs:
	docker-compose logs -f

# Clean up containers, images, and volumes
clean:
	docker-compose down -v
	docker system prune -f

# Run tests in the Go application
test:
	cd api/go && make test

# Rebuild and restart containers
restart: down build up

# Show container status
status:
	docker-compose ps

# Terraform commands
terraform-init:
	cd terraform && \
	terraform init

terraform-plan:
	cd terraform && \
	terraform plan

terraform-apply:
	cd terraform && \
	terraform apply

terraform-destroy:
	cd terraform && \
	terraform destroy
	 