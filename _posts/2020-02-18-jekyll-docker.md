---
layout: post
title: Jekyll & Docker
date: 2020-02-18 12:53 +0000
---

### Deploy a Jekyll Site Using Git Hooks and Docker on **localhost**.


## Dependencies 

- Docker and Docker Compose

To get started with Docker Community Edition  follow the article, 

<a href= "https://micrometreuk.github.io/2020/02/07/docker.html" target="_blank">Install Docker CE on Ubuntu and Debian https://micrometreuk.github.io/2020/02/07/docker.html</a> 

## Server side 

Dirctories needed for the project

Create the folders From home  ~/ 

```bash
mkdir hooks                    # Hooks directory.
mkdir hooks/jekyll.git         # Git initialized bare repository for tracking.
mkdir repos                    # Cloned sourde code.
mkdir puclic                   # Public directory.
mkdir puclic/jekyll            # http://localhost:4000 Site location.
```
Change to jekyll.git hooks directory.

```bash
cd ~/hooks/jekyll.git
```
Initialize a new “bare repository” to track the deployment.

```bash
git init --bare
```

The post-receive hook to start producrion 

```bash
git --work-tree=/home/jekyll/public/jekyll \         # Path to working directory,     
--git-dir=/home/jekyll/hooks/jekyll.git checkout -f  # Git directory 
cd ~/public/jekyll                                   # Changes to producrion location
docker-compose stop                                  # Stops the running container
docker-compose up -d                                 # Runs/re-starts the container
```

## Client side 
Clone the soure repository

```bash
git clone git@github.com:micrometre/jekyll.git
```

Changing to the cloned repository from github.

```bash
cd jekyll
```
Add the deployment hook for the git initialized repository remote url.

```bash
git remote add localhost user@localhost:hooks/jekyll.git

```
- Verify/Show git-remote url 

```bash
git remote -v
droplet	user@localhost:hooks/jekyll.git (fetch)
droplet	user@localhost:hooks/jekyll.git (push)
origin	git@github.com:micrometre/jekyll.git (fetch)
origin	git@github.com:micrometre/jekyll.git (push)
```
Confirm read/write permision to the deployment repository(on localhost).

```bash
git remote show localhost
* remote droplet
  Fetch URL: user@localhost:hooks/jekyll.git
  Push  URL: user@localhost:hooks/jekyll.git
  HEAD branch: master
  Remote branch:
    master tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up-to-date)
```

Now we can push and pull from either remote urls. 

Push to localhost to deploy.

```bash
git add .
git commit -m "pushing to deploy localhost"
git push -u localhost master	

# Successfull deployment will out put something similar 

remote: Deploying master branch to production...
remote: Stopping jekyll_jekyll_1 ... done
remote: Recreating jekyll_jekyll_1 ... done
remote: Starting jekyll ... done
remote: Successfully deployed master branch .
To localhost:hooks/jekyll.git
   4bcce5c..b7f6bf0  master -> master

```
Push to git hub 

```bash
git add .
git commit -m "pushing to git hub"
git push -u origin master	
```

### Geting started 

Create posts, pages and drafts with jekyll-compose.

1. bundle exec jekyll draft "New Post"     

2. bundle exec jekyll post "New Post"     

3. bundle exec jekyll page "New Post"     

