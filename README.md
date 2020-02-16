### How To Deploy a Jekyll Site Using Git Hooks on Ubuntu 18.04
### deploy to digital ocean vi below

- copy the ssh keys and updating ssh confing add the 

```bash
cd micrometre-Jekyll.co.uk
cp files/ssh_config ~/.ssh/config 
```

- Add the deployment hook repo

```bash
git remote add droplet warsong@dev-droplet:hooks/micrometreuk.git
```
- Make your commits and push  

```bash
git add .
git commit -m "pushing to deploy digital ocean"
git push -u droplet	
```
### the easy/lazy option 

> note this is a tracking repo no worktree in here 
### After pushing to droplet the script below will be excuted

```bash

```




























