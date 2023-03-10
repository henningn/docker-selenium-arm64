NAMESPACE=selenium
VERSION=4.8.1-20230306
BASE=node-firefox
BUILD_ARGS="--build-arg NAMESPACE=$NAMESPACE --build-arg VERSION=$VERSION --build-arg BASE=$BASE"

echo "\033[1m> docker build ./Base ${BUILD_ARGS} -t $NAMESPACE/base:$VERSION -f ./Base/Dockerfile\033[0m"
docker build ./Base ${BUILD_ARGS} -t $NAMESPACE/base:$VERSION -f ./Base/Dockerfile
echo "\033[1m> docker build ./NodeBase ${BUILD_ARGS} -t $NAMESPACE/node-base:$VERSION -f ./NodeBase/Dockerfile\033[0m"
docker build ./NodeBase ${BUILD_ARGS} -t $NAMESPACE/node-base:$VERSION -f ./NodeBase/Dockerfile
echo "\033[1m> docker build ./NodeFirefox ${BUILD_ARGS} -t $NAMESPACE/node-firefox:$VERSION -f ./NodeFirefox/Dockerfile\033[0m"
docker build ./NodeFirefox ${BUILD_ARGS} -t $NAMESPACE/node-firefox:$VERSION -f ./NodeFirefox/Dockerfile
echo "\033[1m> docker build ./Standalone $BUILD_ARGS -t henningn/selenium-standalone-firefox:$VERSION-arm -f ./Standalone/Dockerfile\033[0m"
docker build ./Standalone ${BUILD_ARGS} -t henningn/selenium-standalone-firefox:$VERSION-arm -f ./Standalone/Dockerfile
echo "\033[1m> docker push henningn/selenium-standalone-firefox:$VERSION-arm\033[0m"
docker push henningn/selenium-standalone-firefox:$VERSION-arm

echo "\033[1m> docker pull $NAMESPACE/standalone-firefox:$VERSION\033[0m"
docker pull $NAMESPACE/standalone-firefox:$VERSION
echo "\033[1m> docker tag $NAMESPACE/standalone-firefox:$VERSION henningn/selenium-standalone-firefox:$VERSION-x86\033[0m"
docker tag $NAMESPACE/standalone-firefox:$VERSION henningn/selenium-standalone-firefox:$VERSION-x86
echo "\033[1m> docker push henningn/selenium-standalone-firefox:$VERSION-x86\033[0m"
docker push henningn/selenium-standalone-firefox:$VERSION-x86

echo "\033[1m> docker manifest create henningn/selenium-standalone-firefox:$VERSION henningn/selenium-standalone-firefox:$VERSION-arm henningn/selenium-standalone-firefox:$VERSION-x86\033[0m"
docker manifest create henningn/selenium-standalone-firefox:$VERSION henningn/selenium-standalone-firefox:$VERSION-arm henningn/selenium-standalone-firefox:$VERSION-x86
echo "\033[1m> docker manifest push henningn/selenium-standalone-firefox:$VERSION\033[0m"
docker manifest push henningn/selenium-standalone-firefox:$VERSION
