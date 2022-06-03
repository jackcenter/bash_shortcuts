# Create a new workspace
```
# TODO: make this a command
lxc launch --profile default --profile gui ubuntu:XX.XX <container_name> \
lxc file push ~/.ssh/id_ed25519.pub <container_name>/home/ubuntu/.ssh/authorized_keys
lxc file push ~/.ssh/id_ed25519.pub <container_name>/home/ubuntu/.ssh/id_ed25519.pub
lxc file push ~/.ssh/id_ed25519 <container_name>/home/ubuntu/.ssh/id_ed25519

lxc_open <container_name>
```
-clone bash_shortcuts
```
./bash_shortcuts/install.sh <device_name> <environment_name> <user_name>

# TODO: make this part of the install
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
- install terminator `sudo apt install terminator`
- install ros version 
- install rosdep
```
sudo apt install python3-rosdep2
rosdep init
rosdep update
# For a package
rosdep install -i --from-path src --rosdistro foxy -y
```
sudo apt install python3-colcon-common-extensions
```



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
### Storage pools
Create one:
```bash
lxc storage create <name> zfs size=XXGiB
```
Make a container in one:
```bash
lxc launch --profile default --profile gui ubuntu:XX.XX <container_name> -s <pool_name>
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

## Install ccache
```bash   
sudo apt-get update
sudo apt-get install ccache
export PATH="/usr/lib/ccache/bin/:$PATH"
```
Need to add export to .bashrc if you don't want to do it every time.

# Software to install in new Ubuntu environments (TODO)
- ros distro
- google-chrome
- wstool
- terminator
