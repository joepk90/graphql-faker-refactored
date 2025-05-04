DOCKER_REGISTRY=jparkkennaby
SERVER_IMAGE_NAME=graphql-faker-server
EDITOR_IMAGE_NAME=graphql-faker-editor
IMAGE_NAME=graphql-faker-refactored
SERVER_DOCKER_IMAGE=$(DOCKER_REGISTRY)/$(SERVER_IMAGE_NAME)
EDITOR_DOCKER_IMAGE=$(DOCKER_REGISTRY)/$(EDITOR_IMAGE_NAME)
DOCKER_IMAGE=$(DOCKER_REGISTRY)/$(IMAGE_NAME)

docker-pull:
	docker pull $(SERVER_DOCKER_IMAGE):latest
	docker pull $(EDITOR_DOCKER_IMAGE):latest

start:
	docker-compose up -d

stop:
	docker-compose down

docker-build:
	docker build -t ${DOCKER_IMAGE} .

# useful for re-downloading git repos
docker-build-no-cache:
	docker build --no-cache -t ${DOCKER_IMAGE} .

docker-tag:
	docker tag ${DOCKER_IMAGE} ${DOCKER_IMAGE}:latest

docker-push:
	docker push ${DOCKER_IMAGE}:latest

docker-run:
	docker run -it \
	-p 8080:8080 \
	-e VITE_API_URL="/api" \
	${DOCKER_IMAGE}


docker-run-with-custom-envs:
	docker run -it \
	-p 8080:8080 \
	-p 3000:3000 \
	-p 5173:5173 \
	-e SCHEMA_FILE_NAME=schema_extension \
	-e ALLOWED_HOSTS=http://localhost:5173 \
	-e SERVER_PORT=3000 \
	-e EXTEND_URL=https://swapi-graphql.netlify.app/graphql \
	-e VITE_API_URL=/api \
	-e CUSTOM_HEADERS=TRUE \
	-v $(PWD)/.headers:/app/.headers \
	${DOCKER_IMAGE}


# command only for Dockerfile (requires certain directory structure setup in Dockerfile)
# docker-start:
# 	npm run start	