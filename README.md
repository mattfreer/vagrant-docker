vagrant-docker
==============

A vagrant provision of a base ubuntu 15.10

This is just a wrapper for the vagrant docker image at:
https://oss-binaries.phusionpassenger.com/vagrant/boxes/

##Installs:
* lxc-docker (as this is docker-io)
* git (so you can clone docker images via git)
* symlinks dotfiles for vim and tmux

##Configuration:
The following config settings can be managed via environment variables (the defaults are displayed in brackets):
* Private network ip address (192.168.10.10)
* Memory allocation (2048)

##Synced Directories:
Any dir that is in the parent dir will be synced to the vm. For example if your project looks like this:

```bash
├───app
├───scripts
├───env
│   ├───Vagrantfile
```

When you run ```vagrant up``` both the ```app``` and ```scripts``` dir will be synced directories. The synced directories are available under ```/``` within the vm.

Usage
------

* Git clone the repository
* run ```env IP=192.168.124.124 MEM=1204 vagrant up```
    * This will create a new VM on IP ```192.168.124.124```
    * With a memory allocation of 1024
* To ssh into the VM use ```vagrant ssh```
    * (if required) password: ```vagrant```
* Test docker with: ```sudo docker run ubuntu /bin/echo hello world```
