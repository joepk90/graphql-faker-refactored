DOCKER_REGISTRY=jparkkennaby
SERVER_IMAGE_NAME=graphql-faker-server
SERVER_DOCKER_IMAGE=$(DOCKER_REGISTRY)/$(SERVER_IMAGE_NAME)
EDITOR_IMAGE_NAME=graphql-faker-editor
EDITOR_DOCKER_IMAGE=$(DOCKER_REGISTRY)/$(EDITOR_IMAGE_NAME)

docker-pull:
	docker pull $(SERVER_DOCKER_IMAGE):latest
	docker pull $(EDITOR_DOCKER_IMAGE):latest

start:
	docker-compose up -d

stop:
	docker-compose down