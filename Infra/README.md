# Infrastructure of the Project

This directory contains the Terraform configurations for deploying the project's infrastructure on AWS. It includes resources like an EC2 Bastion host, application instances, an RDS database, and associated security groups.
# Infrastructure Architecture Overview

This section provides an overview of the architecture of the infrastructure deployed using this Terraform configuration. Understanding this architecture is crucial for managing and operating your project effectively.

## Architecture Components

### Amazon Virtual Private Cloud (VPC)
- The foundation of your infrastructure is an Amazon VPC, which provides network isolation and segmentation.
- It is divided into public and private subnets for enhanced security and isolation.

### Bastion Host
- The Bastion host is an AWS EC2 instance used as a secure entry point to your private network.
- It allows secure SSH access to other instances within the VPC, such as application servers and the RDS database.

### Application Instances
- These AWS EC2 instances run your application code and are located in private subnets.
- They are part of an auto-scaling group, allowing for horizontal scaling based on traffic demands.
- User data is used for initial setup, including the installation of necessary software and MySQL client configuration.

### Amazon RDS Database
- The RDS instance is a managed MySQL database that stores your application's data.
- Security groups control access to the RDS instance, allowing traffic only from the application instances.

### Security Groups
- AWS security groups are used to manage inbound and outbound traffic to and from various resources within the VPC.
- You have separate security groups for the Bastion host, application instances, and RDS instance, ensuring controlled access.

## Communication Flow
- User traffic typically flows through the Bastion host via SSH for administrative access.
- Application instances communicate with the RDS database over the private network.
- All components are securely isolated within the VPC for enhanced security.

## Terraform Workspace
- The Terraform workspace for this infrastructure is defined in `backend.tf`.
- Ensure that you configure it correctly to use the remote backend for state management.

## Prerequisites
Before deploying this infrastructure, ensure you have the following prerequisites:
1. AWS CLI configured with the appropriate IAM permissions.
2. Terraform installed on your local machine.
3. An SSH key pair generated on your local machine.
4. A value for the `db_password` variable (required for the RDS instance).

Understanding this infrastructure architecture will help you effectively manage, monitor, and scale your project's resources.


## Usage

1. Ensure that you have completed the setup for the S3 remote backend as mentioned in the root README.

2. Modify the necessary variables in the Terraform files if required.

3. Run the following Terraform commands from this directory:

  ```
  terraform init
  ```
    terraform apply

Follow the prompts to apply the changes.

## Terraform Workspace

The workspace used in this directory is defined in backend.tf. Make sure to configure it appropriately.
## Outputs

  - bastion_public_dns: Public DNS of the Bastion host.
  - app_instance_private_ip: Private IP of the application instance.
  - rds_endpoint: Endpoint of the RDS database.

## Clean Up

To destroy the infrastructure resources, run:


```
terraform destroy
```
Remember to confirm the deletion when prompted.




#### These README files provide instructions and information about the two main parts of your project's Terraform configuration. Make sure to follow the prerequisites and usage steps as outlined in each README.
