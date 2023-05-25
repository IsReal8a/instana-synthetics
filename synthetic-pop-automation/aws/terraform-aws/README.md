# Terraforming your Synthetic PoP in AWS

This is a simple and not pretty way to deploy your Point of Presence (PoP) in AWS using Terraform, it can be modified and extended as needed.

It terraforms an Ubuntu amd64 EC2 Instance, installs K3s and Instana's Synthetic Monitoring PoP.

The size of your AWS instances depends on the number and complexity of your tests.
The recommedation is to start with Medium and grow based on the needs.

- Minimum instance size: Medium
- Optimal intance size: XLarge or 2Xlarge (Browser testing)

## Important files to know

### linux-vm-main.tf

I have commented the creation of an Elastic IP, if you need it you can enable that part of the code.
SSH (port 22) is only allowed for administration purposes.
ami variable points to Ubuntu Linux 22.04.

### terraform.tfvars.example

All the variables that you need to know and change based on your needs.
Just be careful on the "AWS Network" section.
After that just rename the file to `terraform.tfvars`

### aws-user-data.sh

All the commands to make the Synthetic PoP work, this is a "not too proud" approach, using a bash file.
Review the file and change the options in the helm install command.

TODO: Convert this to Ansible or something fancier.

## What do you get from this?

Creates an Ubuntu AWS instance with the following:
```
tls_private_key.key_pair
aws_key_pair.key_pair
aws_vpc.vpc
local_file.ssh_key
data.aws_ami.ubuntu-linux-2204
aws_internet_gateway.gw
aws_subnet.public-subnet
aws_security_group.aws-linux-sg
aws_route_table.public-rt
aws_instance.linux-server
aws_route_table_association.public-rt-association
```

If you run the terraform apply again the current AWS will be destroyed.

```
aws_instance.linux-server: Destroying...
```
## Outputs

```
vm_linux_server_instance_id = "i-123456789012345"
vm_linux_server_instance_private_ip = "PRIVATE_IP"
vm_linux_server_instance_public_dns = "PUBLIC_DNS"
vm_linux_server_instance_public_ip = "PUBLIC_IP"
```

## How I run it?!

If it is your first time:

`terraform init`

Then you can use these commands on daily basis

`terraform fmt`

`terraform validate`

`terraform apply`

## SSH connection

Connect with:
```
ssh -i synthetic-pop-dev-linux-us-east-1.pem ubuntu@PUBLIC_IPADDRESS/DNS
```