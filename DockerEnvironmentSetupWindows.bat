docker build %cd% -t loopring/qtum
docker network create --driver bridge qtum_network
docker network ls