terraform {
  backend "s3" {
    bucket         = "project.car"
    key            = "project.car/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "project.car-state-dynamo"
  }
}
