# Chapter 2: Terraform

This chapter talked about how to use Terraform to setup the infrastructure for an Ubuntu VM running on Azure. For more in-depth info about this lab, checkout my article [Learning DevOps (Day 01): Terraform](https://weiseguy.net/posts/series/learning-devops/day-01-terraform/)

**NOTE: Make sure you are signed into Azure through the Azure CLI or Azure Powershell. The Terraform code will not work otherwise.** 

```
az login
```

## Setup

To use this code, you first need to create a Service Principle for the Terraform code. To do so in Terraform, run:
```
az ad sp create-for-rbac --name="<ServicePrinciple name>" --role="Contributor" --scopes="/subscription/<subscription id>"
```

Next, you will need an RSA ssh key named `azure` to connect to the completed VM:
```
ssh-keygen -t rsa -f ~/.ssh/azure -C "SSH Key for Azure lab"
```

Then, you need to init Terraform:
```
terraform init
```

Next, you can either plan or apply the code:
```
terraform plan
    -- OR --
terraform apply
```

To get the public IP address for the VM, run:
```
az vm show -d -g rg-terraform-vm-lab -n ubuntu-vm --query publicIps -o tsv
```

To connect to the VM, run:
```
ssh -i ~/.ssh/azure ansible@`az vm show -d -g rg-terraform-vm-lab -n ubuntu-vm --query publicIps -o tsv`
```

## Cleanup

To clean up this lab, you can run:

```
terraform destroy
```
