####  Jekyll, Github Pages and Docker 

##### Dependencies 

1. Docker and Docker Compose
2. Github account

To Install Docker CE and Docker Compose on Debian and Ubuntu based Linux distributions follow the post from. https://micrometreuk.github.io/2020/02/07/docker.html


Clone the soure repository

```bash
git clone git@github.com:micrometre/jekyll.git
```

Changing to the cloned repository from github.

```bash
cd jekyll

docker-compose up -d

#to update/upgrade:
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up -d --build
```
