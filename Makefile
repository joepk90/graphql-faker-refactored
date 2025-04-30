# DOCKER_REGISTRY=jparkkennaby
SERVER_DOCKER_CONTAINER=graphql-faker-server
EDITOR_DOCKER_CONTAINER=graphql-faker-editor
DOCKER_CONTAINER=graphql-faker-refactored
SERVER_DOCKER_REPOSITORY=$(DOCKER_REGISTRY)/$(SERVER_DOCKER_CONTAINER)
EDITOR_DOCKER_REPOSITORY=$(DOCKER_REGISTRY)/$(EDITOR_DOCKER_CONTAINER)
DOCKER_REPOSITORY=$(DOCKER_REGISTRY)/$(DOCKER_CONTAINER)
LATEST_TAG=latest

docker-pull:
	docker pull $(SERVER_DOCKER_REPOSITORY):$(LATEST_TAG)
	docker pull $(EDITOR_DOCKER_REPOSITORY):$(LATEST_TAG)

start:
	docker-compose up -d

stop:
	docker-compose down

docker-build:
	docker build -t ${DOCKER_REPOSITORY} .

docker-tag:
	docker tag ${DOCKER_REPOSITORY} ${DOCKER_REPOSITORY}:$(LATEST_TAG)

docker-push:
	docker push ${DOCKER_REPOSITORY}:$(DOCKER_REPOSITORY)

docker-run:
	docker run -it \
	-p 9092:9092 \
	-p 8080:8080 \
	${DOCKER_REPOSITORY}


docker-run-with-custom-envs:
	docker run -it \
	-p 9092:9092 \
	-p 8080:8080 \
	-e SCHEMA_FILE_NAME=schema_extension \
	-e ALLOWED_HOSTS=http://localhost:8080 \
	-e SERVER_PORT=9092 \
	-e EXTEND_URL=https://swapi-graphql.netlify.app/graphql \
	-e CUSTOM_HEADERS=TRUE \
	-v $(PWD)/.headers:/app/.headers \
	${DOCKER_IMAGE}


### CI COMMANDS

GOOGLE_REPOSITORY=${GOOGLE_AR_REPO_URL}/${GOOGLE_PROJECT_ID}/${GOOGLE_AR_REPO_NAME}/$(DOCKER_CONTAINER)
GOOGLE_AR_REPO_LOCATION=us-central1
GOOGLE_AR_REPO_NAME=containers
GOOGLE_AR_REPO_PKG=docker.pkg.dev
GOOGLE_AR_REPO_URL=${GOOGLE_AR_REPO_LOCATION}-${GOOGLE_AR_REPO_PKG}
GOOGLE_REPOSITORY=${GOOGLE_AR_REPO_URL}/${GOOGLE_PROJECT_ID}/${GOOGLE_AR_REPO_NAME}/$(DOCKER_CONTAINER)

ci-docker-build:
	# docker build -t $(DOCKER_REPOSITORY):$(COMMIT_SHA) ./
	docker build -t $(DOCKER_REPOSITORY):$(LATEST_TAG) ./
	# @echo "Created new tagged image: $(DOCKER_REPOSITORY):$(COMMIT_SHA)"
	@echo "Created new tagged image: $(DOCKER_REPOSITORY):$(LATEST_TAG)"

ci-gcr-build:
	# docker build -t $(GOOGLE_REPOSITORY):$(COMMIT_SHA) ./
	docker build -t ${GOOGLE_REPOSITORY}:$(LATEST_TAG) ./
	# @echo "Created new tagged image: $(GOOGLE_REPOSITORY):$(COMMIT_SHA)"
	@echo "Created new tagged image: $(GOOGLE_REPOSITORY):$(LATEST_TAG)"

ci-docker-push: ci-docker-auth
	# docker push $(DOCKER_REPOSITORY):$(COMMIT_SHA)
	docker push $(DOCKER_REPOSITORY):$(LATEST_TAG)
	# @echo "Deployed tagged image: $(DOCKER_REPOSITORY):$(COMMIT_SHA)"
	@echo "Deployed tagged image: $(DOCKER_REPOSITORY):$(LATEST_TAG)"

ci-gcloud-configure-docker:
	gcloud auth configure-docker -q ${GOOGLE_AR_REPO_URL}
	@echo "configured gcloud for docker"

# push to google container registry
ci-gcr-push: ci-gcloud-configure-docker ci-gcr-build
	docker push ${GOOGLE_REPOSITORY}:$(LATEST_TAG)
	@echo "Deployed tagged image: $(GOOGLE_REPOSITORY):$(LATEST_TAG)"

# alternatively - this could could be setup in terraform? The concern is if it gets deleted on destory/change
ci-check-create-repository:
	@echo "Checking if repository exists..."
	@REPO_EXISTS=$(shell gcloud artifacts repositories describe $(GOOGLE_AR_REPO_NAME) --location=$(GOOGLE_AR_REPO_LOCATION) --format="value(name)" || echo "not_found") ; \
	if [ "$$REPO_EXISTS" = "not_found" ]; then \
		echo "Repository $(GOOGLE_AR_REPO_NAME) does not exist. Creating it..."; \
		gcloud artifacts repositories create $(GOOGLE_AR_REPO_NAME) --repository-format=docker --location=$(GOOGLE_AR_REPO_LOCATION) --description="Docker repository for ${GOOGLE_AR_REPO_NAME} CI/CD images"; \
	else \
		echo "Repository $(GOOGLE_AR_REPO_NAME) already exists."; \
	fi

