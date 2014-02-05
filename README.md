vagrant-docker
==============

A vagrant provision of a base ubuntu 12.04 (3.8 kernel) with docker already installed

This is just a wrapper for the vagrant docker image at:
https://oss-binaries.phusionpassenger.com/vagrant/boxes/

Installs:
* lxc-docker (as this is docker-io)
* git (so you can clone docker images via git)
* symlinks dotfiles for vim and tmux

Usage
------

* Git clone the repository
* run ```vagrant up```
    * This will create a new VM on IP ```192.168.124.124```
* To ssh into the VM use ```vagrant ssh```
    * (if required) password: ```vagrant```
* Test docker with: ```sudo docker run ubuntu /bin/echo hello world```
