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

### Mount USB Device
Figure out what the device's vendor and product ID are:
```xml
$ lsusb
Bus 004 Device 001: ID ----:---- Linux Foundation 3.0 root hub
Bus 003 Device 001: ID ----:---- Linux Foundation 2.0 root hub
Bus 002 Device 010: ID vvvv:pppp Intel Corp. Intel(R) RealSense(TM) Depth Camera 415 
```
XXXX:XXXX is vendor:product. For example, the RealSense vendor ID is <aaaa> and the product ID is <pppp>.

Next, add the device configuration to the lxc:
```xml
lxc config device add <lxc-name> <pick-a-name> usb vendorid=vvvv productid=pppp gid=1000
```
For a camera:
```
lxc config device add <lxc-name> video0 unix-char path=/dev/video0 gid=1000
```
Where video0 may change depending on what you're using (note: I can't get this to work with cheese, but the camera is mounted?).

## Ubuntu

### Setup a new user
```xml
sudo adduser <user-name>
sudo usermod -aG sudo <user-name>
su <user-name>
```
  
# Software to install in new Ubuntu environments (TODO)
- ros distro
- google-chrome
- wstool
- terminator
