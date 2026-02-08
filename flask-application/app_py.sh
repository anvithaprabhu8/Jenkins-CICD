echo "logging in to dockerhub"
echo $DOCKERHUB_PWD | docker login -u $DOCKERHUB_USER --password-stdin

IMAGE="anvithaprabhu98/flask-app"
TAG=${BUILD_NUMBER}

echo "Building docker image"
cd flask-application
docker build -t "$IMAGE:$TAG" -t "$IMAGE:latest" .

echo "Push docker image"
docker push "$IMAGE:$TAG" 
docker push "$IMAGE:latest" 

echo "deploying .."
docker pull "$IMAGE:$TAG" 
docker rm -f flask-app || true
docker run -d --name flask-app -p 5000:5000 "$IMAGE:$TAG" 

sleep 2
echo "Hit http://localhost:5000/ to see the application"

echo "cleaning up workspace"
rm -rf $WORKSPACE/* || true
