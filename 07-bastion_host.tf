# Data sources to reference existing VPC, subnets, and security groups
data "aws_vpc" "existing_vpc" {
  id = aws_vpc.vpc.id  # Replace with actual VPC ID if external
}

data "aws_subnet" "public_subnet_az1" {
  id = aws_subnet.public_subnet_az1.id  # Replace with actual subnet ID if external
}

data "aws_security_group" "bastion_sg" {
  id = aws_security_group.bastion_security_group.id  # Reference to existing Bastion Security Group
}

# Create the EC2 Bastion Host
resource "aws_instance" "bastion" {
  ami                    = "ami-0cf4e1fcfd8494d5b"  # Replace with correct AMI ID for us-west-1
  instance_type          = "t2.micro"
  key_name               = "project3"  # Correct syntax for the key pair name
  availability_zone      = "us-west-1a"  # Updated to us-west-1a
  subnet_id              = data.aws_subnet.public_subnet_az1.id  # Use Public Subnet AZ1
  vpc_security_group_ids = [data.aws_security_group.bastion_sg.id]  # Use Bastion SG by ID

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion-host"
  }
}
