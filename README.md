### Deploy a Jekyll Site Using Git Hooks and Docker to digitalocean

#### Dependencies Docker & Docker Compose

**We will be using two remote url fo pull & push deployment**

- Source code or Work tree url 
1 git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git 

- Deployment live enviroment
2 warsong@dev-droplet:hooks/micrometreuk.git 



1 Clone the soure repository

```bash
git clone git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git 
```
2  Add ssh confing to users home ~/ssh

```bash
cd micrometre-Jekyll.co.uk
cp files/ssh_config ~/.ssh/config 
```

3 Add the deployment hook repo

```bash
git remote add droplet warsong@dev-droplet:hooks/micrometreuk.git
```
4 Now we can push to either remote urls 

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


### The easy option 

-  Working without gitea 

> clone the repo and push to droplet master
  note this is a tracking repo no worktree in here and its the production live/repo 

```bash
git clone  warsong@dev-droplet:hooks/micrometreuk.git 

```
- Push to droplet to deploy
```bash
git add .
git commit -m "pushing to gitea"
git push -u origin master	
```











