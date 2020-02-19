### Deploy a Jekyll Site Using Git Hooks and Docker to Digitalocean

#### Dependencies 

1. Docker and Docker Compose
2. SSH Client configed for SSH key-based authentication


To Install Docker CE and Docker Compose on Debian and Ubuntu based Linux distributions follow the post from.
- https://micrometre.co.uk/2020/02/06/docker.html

To Configure SSH Client for  key-based authentication use  follow post from.
- https://micrometre.co.uk/2020/02/17/ssh.html

For working examples using Github pages and localhost, check the links below. 
- https://micrometreuk.github.io    
- https://github.com/micrometre/jekyll
- https://micrometre.co.uk/2020/02/18/jekyll-docker.html



#### Project Workflow



|                    Pull & make changes                               |                    Push deployment                         |   
|:--------------------------------------------------------------------:|:----------------------------------------------------------:|
|                  Source code repository                              |                 Deployment repository                      |   
|git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git    |        injera@injera-droplet:hooks/micrometreuk.git        |          
|https://gitea.micrometre.uk/infrastructure/micrometre-Jekyll.co.uk    |        https://micrometre.co.uk



1 Clone the soure repository
```bash
git clone git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git 
```
*Due to Gitea using port 22. configure ssh setings first*

- Changing to the cloned repository.

```bash
cd micrometre-Jekyll.co.uk
```
- Copy ssh confing to users home ~/.ssh 

```bash
cp files/ssh_config ~/.ssh/config 
```

3 Add the deployment hook repo remote url
```bash
git remote add droplet injera@injera-droplet:hooks/micrometreuk.git
```
- Verify/Show git-remote url 

```bash
git remote -v
```
> Should out put

```bash
droplet	injera@injera-droplet:hooks/micrometreuk.git (fetch)
droplet	injera@injera-droplet:hooks/micrometreuk.git (push)
origin	git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git (fetch)
origin	git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git (push)
```
Confirm access ie read/write permision to the deployment repository(droplet master).

```bash
git remote show droplet 
```
> Should out put

```bash
* remote droplet
  Fetch URL: injera@injera-droplet:hooks/micrometreuk.git
  Push  URL: injera@injera-droplet:hooks/micrometreuk.git
  HEAD branch: master
  Remote branch:
    master tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up-to-date)
```

4 Now we can push and pull from either remote urls 

- Push to droplet to deploy
```bash
git add .
git commit -m "pushing to deploy digital ocean"
git push -u droplet master	
```
- Push to gitea
```bash
git add .
git commit -m "pushing to gitea"
git push -u origin master	
```


## Server/droplet side 

- Creat dirctories from home ie ~/ 

```bash
mkdir hooks                         # Hooks directory for all infrastructure droplets.
mkdir hooks/micrometreuk.gita       # Git initialized bare repository for tracking.
mkdir repos                         # Cloned sourde code from Gitea.
mkdir puclic                        # Public directory for all infrastructure.
mkdir puclic/micrometreuk           # https://micrometre.co.uk/ location.
```

- Confirm the worktree

```bash
ls ~/
```
> Should out put
```bash
hooks/micrometreuk.git/   public/micrometreuk/  repos/  
```

- Change to micrometreuk hooks direcory

```bash
cd ~/hooks/micrometre.git
```
- Create a new “bare repository” to track the deployment .

```bash
git init --bare
```

##### The post-receive hook to start producrion 

- Forces the transaction. 
- Ignores conflicts in the working directory. 
- Copies the repository to the public directory 
- Excutes deployment commands.

```bash
git --work-tree=/home/injera/public/micrometreuk --git-dir=/home/injera/hooks/micrometreuk.git checkout -f    
cd ~/public/micrometreuk                            # changes to the https://micrometre.co.uk/ location
docker-compose stop                                 # stops the running container
docker-compose up -d                                # runs/re-starts the container
```
*The public directory isn't a repository, Only the code for deployment*.

Use Makefile for tab compltion(short-cut).

```bash
push_to_gitea:
	git add .
	git commit -m "Pushing to Gitea"
	git push -u origin master
push_to_droplet:
	git add .
	git commit -m "Pushing to Droplet for deployment"
	git push -u droplet master
```
* To push to Gitea with Makefile.

```bash
make  push_to_gitea
```
## To do list

- Github remote   
- Create branch
https://micrometreuk.github.io
