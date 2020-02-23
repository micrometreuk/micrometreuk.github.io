###  Jekyll, Github Pages and Docker 

#### Dependencies 

1. Docker and Docker Compose
2. Github account


To Install Docker CE and Docker Compose on Debian and Ubuntu based Linux distributions follow the post from. https://micrometre.co.uk/2020/02/06/docker.html

To Configure SSH Client for  key-based authentication use  follow post from.
- https://micrometre.co.uk/2020/02/17/ssh.html

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
```
```bash
git add .
git commit -m "pushing to git hub"
git push -u origin master	
```

### Geting started 

```bash
Create posts, pages and drafts with jekyll-compose.

1. bundle exec jekyll draft "New Post"     

2. bundle exec jekyll post "New Post"     

3. bundle exec jekyll page "New Post"     
```

## To do list

1. [ ] 
