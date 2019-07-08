docker network create --driver=overlay traefik-public
docker network create --driver=overlay traefik-private

export EMAIL=admin@example.com
export DOMAIN=sys.example.com

export USERNAME=admin
export PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
echo $HASHED_PASSWORD

export CONSUL_REPLICAS=3

export TRAEFIK_REPLICAS=3

docker stack deploy -c traefik.yml traefik-consul

docker stack ps traefik-consul
