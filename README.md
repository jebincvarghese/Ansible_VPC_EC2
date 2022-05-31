# Ansible VPC EC2 and deploy a sample springboot java application to an EC2 instance in private subnet using application load balancer .

##  Setup a bastion host VPC architecture on AWS.

The playbook main.yml creates a Bastion Host VPC architecture on your AWS account. The entries given in the vars.yml determines the region to be selected, vpc and subnet cidr address etc.
This playbook runs only in regions having minimum 2 AZ, because it is set to create two subnets likely two Public subents and two Private subnet.The private subnet can only be accessed from the instances/services inside the vpc.Private subnet have not given direct internet connectivity.
The NAT gateway, which is created in one of the public subnet gives internet access to the instances in private subnet. An Elastic IP is attached to the NAT gateway. Security groups for all the three subnets are also been setup in the playbook.

---
### Prerequisite:
1. Install Ansible on an ec2 Instance and setup it as Ansible-master
2. Python boto library
3. Create an IAM Role with Policy AmazonEC2FullAccess and attach it to the Ansible master instance.
---
