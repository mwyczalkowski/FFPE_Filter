source docker_image.sh

cd ..
docker build -t $IMAGE_PROCESS -f docker/Dockerfile.process .
