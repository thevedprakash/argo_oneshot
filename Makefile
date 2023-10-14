GCP_PROJECT=argo-demo-401813
IMAGE_NAME=zero_shot_text_classification
VERSION=1.0.0
build:
	docker build  -t "${IMAGE_NAME}" .

docker-auth:
	gcloud auth configure-docker

tag:
	docker tag "${IMAGE_NAME}" "gcr.io/${GCP_PROJECT}/${IMAGE_NAME}:${VERSION}"

push:
	docker push "gcr.io/${GCP_PROJECT}/${IMAGE_NAME}:${VERSION}"

cloud-build:
	gcloud builds submit --tag "gcr.io/${GCP_PROJECT}/${IMAGE_NAME}:${VERSION}"
# build:
# 	docker build .

# run: 
# 	docker compose up --build run 

# test: 
# 	docker compose run --build test 