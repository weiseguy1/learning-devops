# Chapter 3: Ansible

This chapter talked about Ansible and how to use it to provision machines with the necessary programs and configuration files.

## Requirements

In this lab, you will need to have a few things installed or configured.

Programs:
- Terraform
- Ansible
- Azure CLI

Configurations:
- An RSA SSH key named `azure`
- A new `group_vars/databases/main.yml`. (More info below)
- A `vault_pass.txt`. (More info below)

## Configuration

To start, you will need a RSA key for Azure. To do this, run:
```
ssh-keygen -t rsa -f ~/.ssh/azure -C "RSA key for Azure"
```

> NOTE: Make sure you are logged into azure cli. If not run `az login` 

Next, you are going to need to replace the `main.yml` file with a file of your own. Inside the file, it needs to contain some variables. They are `mysql_user` and `mysql_password`. This is what the file should look like:
```
cat group_vars/databases/main.yml
---
mysql_user: adifferentuser
mysql_password: adifferentuserpassword

```

After you're done setting up the `main.yml` file, you need to encrypt the file. To do this, run:
```
ansible-vault encrypt group_vars/databases/main.yml
```
It will ask you for a password twice, so think if something you'll remember. 

Finally, to finish the configuration section, create a `.vault_pass.txt` file with the password you just used to encrypt the `main.yml` file. 

## Running the lab

To run the lab, you first need to init terraform
```
terraform init
```

Then you just need to apply the changes
```
terraform apply
```

TADA! You're done!!
