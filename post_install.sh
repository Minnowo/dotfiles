#!/bin/sh

# disable avahi
sudo systemctl disable avahi-daemon.socket
sudo systemctl disable avahi-daemon.service
sudo systemctl mask avahi-daemon.socket
sudo systemctl mask avahi-daemon.service

# enable syncthing
systemctl --user enable syncthing.service

# enable docker on use
sudo systemctl enable docker.socket
sudo usermod -a -G docker $USER

#
sudo systemctl enable libvirtd.socket --now
sudo usermod -a -G libvirt $USER

