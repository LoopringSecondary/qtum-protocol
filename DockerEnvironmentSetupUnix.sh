docker build ${PWD} -t loopring/qtum
docker network create --driver bridge qtum_network
docker network ls