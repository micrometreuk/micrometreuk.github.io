### Deploy a Jekyll Site Using Git Hooks and Docker to digitalocean

#### Dependencies Docker & Docker Compose

**We will be using two remote url fo pull & push deployment**

- Source code or Work tree from gitea url 
    - git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git 

- Where Deployment enviroment/droplet is
    - warsong@dev-droplet:hooks/micrometreuk.git 






1 Clone the soure repository

```bash
git clone git@gitea.micrometre.uk:infrastructure/micrometre-Jekyll.co.uk.git 
```
2  Add ssh confing to users home ~/ssh this is neede due to the droplet ssh configration.


```bash


Host *
    StrictHostKeyChecking no # stop gitea complaning about known_host 
Host dev-droplet 
    Hostname 167.172.60.193
    Port 2244 
Host injera-droplet
    Hostname 139.59.189.131
    Port 2244
```

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

>  Note this is production live/repo 

-  Clone the repository

```bash
git clone  warsong@dev-droplet:hooks/micrometreuk.git 

```
- Make your changes and push to droplet to deploy
```bash
git add .
git commit -m "pushing to deploy digital ocean"
git push -u origin master	
```
