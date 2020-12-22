echo "\033[1m> docker build ./Base -t selenium/base:$1 -f ./Base/Dockerfile\033[0m"
docker build ./Base -t selenium/base:$1 -f ./Base/Dockerfile
echo "\033[1m> docker build ./NodeBase -t selenium/node-base:$1 -f ./NodeBase/Dockerfile\033[0m"
docker build ./NodeBase -t selenium/node-base:$1 -f ./NodeBase/Dockerfile
echo "\033[1m> docker build ./NodeFirefox -t selenium/node-firefox:$1 -f ./NodeFirefox/Dockerfile\033[0m"
docker build ./NodeFirefox -t selenium/node-firefox:$1 -f ./NodeFirefox/Dockerfile
echo "\033[1m> docker build ./StandaloneFirefox -t henningn/selenium-standalone-firefox:$1-arm -f ./StandaloneFirefox/Dockerfile\033[0m"
docker build ./StandaloneFirefox -t henningn/selenium-standalone-firefox:$1-arm -f ./StandaloneFirefox/Dockerfile
echo "\033[1m> docker push henningn/selenium-standalone-firefox:$1-arm\033[0m"
docker push henningn/selenium-standalone-firefox:$1-arm

echo "\033[1m> docker pull selenium/standalone-firefox:$1\033[0m"
docker pull selenium/standalone-firefox:$1
echo "\033[1m> docker tag selenium/standalone-firefox:$1 henningn/selenium-standalone-firefox:$1-x86\033[0m"
docker tag selenium/standalone-firefox:$1 henningn/selenium-standalone-firefox:$1-x86
echo "\033[1m> docker push henningn/selenium-standalone-firefox:$1-x86\033[0m"
docker push henningn/selenium-standalone-firefox:$1-x86

echo "\033[1m> docker manifest create henningn/selenium-standalone-firefox:$1 henningn/selenium-standalone-firefox:$1-arm henningn/selenium-standalone-firefox:$1-x86\033[0m"
docker manifest create henningn/selenium-standalone-firefox:$1 henningn/selenium-standalone-firefox:$1-arm henningn/selenium-standalone-firefox:$1-x86
echo "\033[1m> docker manifest push henningn/selenium-standalone-firefox:$1\033[0m"
docker manifest push henningn/selenium-standalone-firefox:$1
