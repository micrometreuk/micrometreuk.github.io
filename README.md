### How To Deploy a Jekyll Site Using Git Hooks on Ubuntu 18.04
### deploy to digital ocean vi below

### after copying the ssh keys and updating ssh confing add the 

```bash
cd micrometre-Jekyll.co.uk

cp files/ssh_config ~/.ssh/config 
'''

### Add the deployment hook repo

```bash
git remote add droplet ssh://dev-droplet/home/warsong/hooks/micrometreuk.git
```

make your commits and push  
```bash
git add .
git commit -m "pushing to deploy digital ocean"
git push -u droplet	
```
