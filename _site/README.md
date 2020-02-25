###  Jekyll, Github Pages and Docker 

#### Dependencies 

1. Docker and Docker Compose
2. Github account

To Install Docker CE and Docker Compose on Debian and Ubuntu based Linux distributions follow the post from. https://micrometre.co.uk/2020/02/06/docker.html


For working examples using Github pages and localhost, check the links below. 
- https://micrometreuk.github.io    
- https://github.com/micrometre/jekyll
- https://micrometre.co.uk/2020/02/18/jekyll-docker.html

To get started with Docker Community Edition  follow the article, 

<a href= "https://micrometre.co.uk/2020/02/06/docker.html" target="_blank">Install Docker CE on Ubuntu and Debian</a> 

Clone the soure repository

```bash
git clone git@github.com:micrometre/jekyll.git
```

Changing to the cloned repository from github.

```bash
cd jekyll

docker-compose up -d
#to update docker_upgrade:
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up -d --build
#docker_start:
	docker-compose start
docker_stop:
	docker-compose stop
docker_restart:	
	docker-compose stop
	docker-compose start



```
