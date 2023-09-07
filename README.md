# Terraform-with-s3-bucket-backend

### Welcome to This Terraform Configuration Repo. It creates an Amazon S3 bucket to serve as the remote backend for your infrastructure project. The bucket is configured for versioning and set to private access.

## Prerequisites

Before you proceed, make sure you have the following prerequisites:

1. AWS CLI configured with appropriate IAM permissions.
2. Terraform installed on your local machine.
3. An SSH key pair generated on your local machine.
4. A value for the `db_password` variable (to be used in the `infra` directory).

## Usage

1. Clone this repository to your local machine.

2. Modify the `s3.tf` file if you want to change the bucket name.

3. Run the following Terraform commands:

```
    terraform init
```
        terraform apply
4. Follow the prompts to apply the changes.

5. Once the S3 bucket is created, it will be used as a remote backend for the infrastructure in the 'infra' directory.

## Outputs

### bucket_name: The name of the S3 bucket created.

## Clean Up

- To destroy the S3 bucket and its resources, run:


```
  terraform destroy
```
### Remember to confirm the deletion when prompted.
