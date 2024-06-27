#!/bin/sh

# DESCRIPTION: Automatically generate inventory file for ansible

database=$(az vm list --resource-group rg-ansible-vm-lab --show-details --query "[*].{TAGS:tags.role, PIP:publicIps}" -o tsv | grep database | awk '{print $2}')

webserver=$(az vm list --resource-group rg-ansible-vm-lab --show-details --query "[*].{TAGS:tags.role, PIP:publicIps}" -o tsv | grep webserver | awk '{print $2}')
echo "[databases] $database " | tr ' ' '\n' >> inventory
echo "[webservers] $webserver" | tr ' ' '\n' >> inventory
