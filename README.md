# Useful Commands
## ssh
### Generate a new key
```
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"      # start the ssh-agent in the background
ssh-add ~/.ssh/id_ed25519   # add the private key to the ssh-agent
```

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

### Rename
```
lxc stop <old-lxc-name>
lxc move <old-lxc-name> <new-lxc-name>
lxc_open <new-lxc-name>
```
Inside the container update the hostname:
```
echo '<new-lxc-name>' > /etc/hostname
sed -i 's/<old-lxc-name>/<new-lxc-name>/g' /etc/hosts
exit
```
Restart the container
```
lxc restart <new-lxc-name>
```

# Software to install in new Ubuntu environments (TODO)
- ros distro
- google-chrome
- wstool
- terminator
