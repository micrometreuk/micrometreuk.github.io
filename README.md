### How To Deploy a Jekyll Site Using Git Hooks on Ubuntu 18.04
### deploy to digital ocean vi below

### after copying the ssh keys and updating ssh confing add the 
```bash
git remote add droplet ssh://injera@injerareview/home/injera/hooks/micrometreuk.git (fetch)
```
make your commits and push  
```bash
git add .
git commit -m "pushing to deploy digital ocean"
git push -u droplet	
```
