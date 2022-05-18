# Ansible VPC EC2 via Dynamic-inventory

##  Setup a Linux bastion host VPC architecture on AWS

The playbook aws-vpc.yml creates a Bastion Host VPC architecture on your AWS account. The entries given in the vars.yml determines the region to be selected, vpc and subnet cidr address etc.
This playbook runs only in regions having minimum 3 AZ, because it is set to create three subnets likely two Public subents and one Private subnet.The private subnet can only be accessed from the instances/services inside the vpc.Private subnet have not given direct internet connectivity.
The NAT gateway, which is created in one of the public subnet gives internet access to the instances in private subnet. An Elastic IP is attached to the NAT gateway. Security groups for all the three subnets are also been setup in the playbook.
