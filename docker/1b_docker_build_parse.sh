source docker_image.sh

cd ..
docker build -t $IMAGE_PARSE -f docker/Dockerfile.parse .
