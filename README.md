Quick howto

```
#build
docker build -t ssh .
```
```
#run
docker run -d -p 2222:22 --name vscode-ssh -v ${HOME}:/mnt --restart unless-stopped darf/vscode-ssh
```