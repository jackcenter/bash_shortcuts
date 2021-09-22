# Useful Commands
## LXC

### Create fresh container
```
lxc launch --profile default --profile gui ubuntu:XX.XX <container_name> \
lxc file push ~/.ssh/id_ed25519.pub <container_name>/home/ubuntu/.ssh/authorized_keys
```

### Push file to container
```
lxc file push myfile.txt mycontainer/home/ubuntu/
```

### Setup remote
```
ssh-keygen -t ed25519 -C "<comment>" #copy to repo
```

### Snapshot
```
lxc snapshot <container> <snapshot-name>
```

### Restore
```
lxc restore <container> <snapshot-name>
```

### Delete
```
lxc delete <container>/<snapshot>
```