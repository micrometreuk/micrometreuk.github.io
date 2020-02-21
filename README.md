### Deploy a Jekyll Site Using Git Hooks and Docker to Digitalocean

#### Dependencies 

1. Docker and Docker Compose, to Install Docker CE and Docker Compose on Debian and Ubuntu based Linux distributions.
Follow the post from https://micrometre.co.uk/2020/02/06/docker.html

2. SSH Client configed for SSH key-based authentication, To Configure SSH Client for  key-based authentication use  follow post from. https://micrometre.co.uk/2020/02/17/ssh.html

For working examples using Github pages and localhost, check the links below. 
- https://micrometreuk.github.io    
- https://github.com/micrometre/jekyll
- https://micrometre.co.uk/2020/02/18/jekyll-docker.html


**Due to Gitea using port 22 by default, we need to configure ssh setings for the user's home**

Start with copying the ssh config loacted in the repository /file/config to user's home.

Clone the soure repository. 

```bash
git clone git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git 
```
Change to the cloned repository.

```bash
cd micrometre-Jekyll.co.uk
```
Copy ssh confing to users home ~/.ssh 

```bash
cp files/ssh_config ~/.ssh/config 
```
Line 2 on ssh config file shows no StrictHostKeyChecking, we need this for the git hook to work.

This will disable strict host key checking for the hosts declared on the config file.

```bash
Host injera-droplet
    StrictHostKeyChecking no
    Hostname 139.59.189.131
    User injera
    Port 2244
Host dev-droplet
    StrictHostKeyChecking no
    Hostname 167.172.60.193
    Port 2244
    User warsong
```

#### Project Workflow
|Job-no|Location |Repositories|API End-points| 
|:-:|:---:|:----------------------------------------------------------------:|
|1|Gitea|https://gitea.micrometre.uk/infrastructure/micrometre-Jekyll.co.uk|https://micrometre.co.uk|
|2|Droplet|injera@injera-droplet:hooks/micrometreuk.git| https://micrometre.co.uk|
|3|Droplet|injera@injera-droplet:hooks/micrometreuk.git| https://micrometreuk.github.io|
   

Add the deployment hook repo remote url

1. Use git remote add command the droplet hook repository.

```bash
git remote add droplet injera@injera-droplet:hooks/micrometreuk.git
```

2. It's same as copying the  .gitconfig file from from the repository /file foleder ~/users home .

```bash
cp file/.gitconfig
```
Afte completing one of the above Verify/Show git-remote url is added.

```bash
git remote -v
```
> Should out put

```bash
droplet	    injera@injera-droplet:hooks/micrometreuk.git (fetch)
droplet	    injera@injera-droplet:hooks/micrometreuk.git (push)
origin	    git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git (fetch)
origin	    git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git (push)
```
Now we Confirm permision to the deployment repository(droplet master).

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

Now we can push and pull from either remote urls 

Use Makefile for tab compltion(short-cut).

```bash
push_to_gitea:
	git add .
	git commit -m "Pushing to Gitea repository https://gitea.micrometre.uk/infrastructure/micrometre-Jekyll.co.uk"
	git push -u origin master
push_to_droplet:
	git add .
	git commit -m "Pushing to Droplet for deployment https://micrometre.co.uk/"
	git push -u droplet master
```
* To push to Gitea with Makefile.

```bash
make  push_to_gitea
```

## Server/droplet side this is configured and ready. only for reference

Creat dirctories from home ie ~/ 

```bash
mkdir hooks                         # Hooks directory for all infrastructure droplets.
mkdir hooks/micrometreuk.gita       # Git initialized bare repository for tracking.
mkdir repos                         # Cloned sourde code from Gitea.
mkdir puclic                        # Public directory for all infrastructure.
mkdir puclic/micrometreuk           # https://micrometre.co.uk/ location.
```

Confirm the worktree

```bash
ls ~/
```
> Should out put
```bash
hooks/micrometreuk.git/   public/micrometreuk/  repos/  
```

Change to micrometreuk hooks direcory

```bash
cd ~/hooks/micrometre.git
```

Create a new “bare repository” to track the deployment .

```bash
git init --bare
```

##### The post-receive hook to start producrion 

Copy the post-receive file to the hooks directory.

```bash
cp files/post-receive hooks/post-receive

```
Description 

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

### complete the project

1. [ ] github pages pipeline
2. [ ] Hosting Prices
4. [ ] Update https://github.com/micrometre/dotfiles    <<<<<>>>>>       https://gitea.micrometre.uk/infrastructure/configs    
5. [ ] Update https://github.com/micrometreuk/ansible
6. [ ] Update https://gitea.micrometre.uk/infrastructure/logs
7. [ ] Update https://gitea.micrometre.uk/infrastructure/framework
8. [ ] Update https://gitea.micrometre.uk/infrastructure/wordpress-dev

