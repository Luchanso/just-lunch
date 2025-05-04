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

## Install registry:
```
rsync -chavzP --stats ./registry/docker-compose.yml username@example.com:~/registry/
rsync -chavzP --stats ./registry/.env username@example.com:~/registry/
```


## For local debug
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
