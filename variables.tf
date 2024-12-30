# Environment variables
variable "region" {
  description = "Region to create resources"
  type        = string
  default     = "us-west-1"  # Default to your specified region
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

# VPC variables
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "Public subnet AZ1 CIDR block"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "Public subnet AZ2 CIDR block"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  description = "Private app subnet AZ1 CIDR block"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "Private app subnet AZ2 CIDR block"
  type        = string
}

variable "private_data_subnet_az1_cidr" {
  description = "Private data subnet AZ1 CIDR block"
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  description = "Private data subnet AZ2 CIDR block"
  type        = string
}

# Security groups variable
variable "ssh_location" {
  description = "IP address that can SSH into the servers"
  type        = string
}

# RDS variables
variable "db_master_username" {
  description = "Database username"
  type        = string
}

variable "db_master_password" {
  description = "Database password"
  type        = string
}

# acm variables
variable "domain_name" {
  description = "domain name"
  type = string
}

variable "alternative_names" {
  description = "sub domain name"
  type = string
}

# S3 variables
variable "env_file_bucket_name" {
  description = "s3 bucket name"
  type = string
}

variable "env_file_name" {
  description = "env file name"
  type = string
}

# ECS variables
variable "architecture" {
  description = "ecs cpu architecture"
  type = string
}

variable "container_image" {
  description = "container image uri"
  type = string
}

# Route53 variables
variable "record_name" {
  description = "sub domain name"
  type = string
}

# ECS specific variables
variable "ecr_account_id" {
  description = "The AWS ECR account ID"
  type        = string
}

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "image_tag" {
  description = "The tag for the container image"
  type        = string
}
