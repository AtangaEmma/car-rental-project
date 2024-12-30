# environment variables
region             = "us-west-1"
project_name       = "autorentify"
environment        = "dev"

# VPC variables
vpc_cidr           = "10.0.0.0/16"
public_subnet_az1_cidr = "10.0.1.0/24"
public_subnet_az2_cidr = "10.0.2.0/24"
private_app_subnet_az1_cidr = "10.0.3.0/24"
private_app_subnet_az2_cidr = "10.0.4.0/24"
private_data_subnet_az1_cidr = "10.0.5.0/24"
private_data_subnet_az2_cidr = "10.0.6.0/24"

# Security groups variable
ssh_location       = "0.0.0.0/0"  # Allow SSH from anywhere (adjust for more restricted access)

# RDS variables
db_master_username = "admin"
db_master_password = "olusola123"

# ACM variables
domain_name        = "eta-oko.com"
alternative_names  = "www.eta-oko.com"

# S3 variables
env_file_bucket_name="ecs-env-file-bucket-st"
env_file_name="rentzone.env"

# ECS variables
architecture        = "X86_64"  # Specify your architecture (e.g., "x86_64", "arm64")
container_image     = "851725512876.dkr.ecr.us-west-1.amazonaws.com/car-rental-app:latest"

ecr_account_id = "851725512876"   # Replace with your AWS account ID
repository_name = "car-rental-app"  # Replace with your ECR repository name
image_tag = "latest"  # Replace with the correct image tag if not "latest"


# Route53 variables
record_name         = "www"
