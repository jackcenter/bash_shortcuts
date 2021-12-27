# Useful Commands
## ssh
### Generate a new key
```xml
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"      # start the ssh-agent in the background
ssh-add ~/.ssh/id_ed25519   # add the private key to the ssh-agent
```

## LXC

### Install
```
sudo apt-get install lxc
sudo apt-get install lxd
lxd init
```
### Create GUI profile
```xml
lxc profile create gui
cat lxdguiprofile.txt | lxc profile edit gui
```
### Create fresh container
```xml
lxc launch --profile default --profile gui ubuntu:XX.XX <container_name> \
lxc file push ~/.ssh/id_ed25519.pub <container_name>/home/ubuntu/.ssh/authorized_keys
```

### Push file to container
```xml
lxc file push myfile.txt mycontainer/home/ubuntu/
```

### Setup remote
```xml
ssh-keygen -t ed25519 -C "<comment>" #copy to repo
```

### Snapshot
```xml
lxc snapshot <container> <snapshot-name>
```

### Restore
```xml
lxc restore <container> <snapshot-name>
```

### Delete
```xml
lxc delete <container>/<snapshot>
```

### Rename
```xml
lxc stop <old-lxc-name>
lxc move <old-lxc-name> <new-lxc-name>
lxc_open <new-lxc-name>
```
Inside the container update the hostname:
```xml
echo '<new-lxc-name>' > /etc/hostname
sed -i 's/<old-lxc-name>/<new-lxc-name>/g' /etc/hosts
exit
```
Restart the container
```xml
lxc restart <new-lxc-name>
```
## Ubuntu

### Setup a new user
```xml
sudo adduser <user-name>
sudo usermod -aG sudo <user-name>
su <user-name>
```

### Activate SPI
create `KERNEL=="spidev0.1", OWNER="root", GROUP="spi"` with:
```bash
KERNEL=="spidev0.0", OWNER="root", GROUP="spi"
KERNEL=="spidev0.1", OWNER="root", GROUP="spi"
```
Create the group and assign users to it:
```bash
sudo groupadd -f --system spi
sudo usermod -a -G spi ubuntu
```
Restart
```bash
sudo shutdown -r now
```
  
# Software to install in new Ubuntu environments (TODO)
- ros distro
- google-chrome
- wstool
- terminator
