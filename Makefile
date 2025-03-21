# Variables
DOCKER_USERNAME = modern123
IMAGE_NAME = claim-process-event
VERSION = 1.5

# Login to Docker Hub
login:
	@echo "Logging into Docker Hub..."
	docker login -u $(DOCKER_USERNAME) -p ###

# Build the Docker image with version tagging
build:
	@echo "Building Docker image with version tag: $(VERSION)..."
	docker build -t $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION) .

# Push the Docker image to Docker Hub
push: login build
	@echo "Pushing Docker image to Docker Hub with version tag: $(VERSION)..."
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION)

# Clean up local Docker images
clean:
	@echo "Cleaning up local Docker images..."
	docker rmi $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION) || true