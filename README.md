# Just lunch

secrets:
- HOST
- HOST_USERNAME
- REGISTRY_HOST
- REGISTRY_USERNAME
- REGISTRY_PASSWORD
- SSH_PRIVATE_KEY
- SSH_KNOW_HOSTS
- APP_ENV

env:
- APP_NAME

## Install

### Install traefik (1st step)
```sh
rsync -chavzP --stats ./traefik/ username@example.com:~/traefik/
ssh username@example.com
cd traefik
docker compose up -d
```

### Install registry (2nd step)
```sh
# Generating strong password
openssl rand -base64 32

rsync -chavzP --stats ./registry/docker-compose.yml username@example.com:~/registry/
rsync -chavzP --stats ./registry/generate-password.sh username@example.com:~/registry/
ssh username@example.com
cd registry
./generate-password.sh LOGIN PASSWORD
docker compose up -d
```

### Install application (3rd step)
Run this step after all images published in your registry (see Build & Push)
```sh
rsync -chavzP --stats ./app/ username@example.com:~/app/
cd app
docker compose up -d
```


## Build & Push
```sh
docker buildx bake production --push # build & remote push
```

## Local debug
mkcert for certs
```sh
brew install mkcert
mkcert -install
cd traefik && mkdir certs && cd certs
mkcert "*.luchanso.mvp" luchanso.mvp
```

dnsmasq for debugging dns
```sh
brew install dnsmasq
# echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/mvp
# don't forget add "address=/.luchanso.mvp/127.0.0.1" to /opt/homebrew/etc/dnsmasq.conf
sudo brew services start dnsmasq
# sudo brew services restart dnsmasq

# For flushing DNS:
# sudo killall -HUP mDNSResponder
```
