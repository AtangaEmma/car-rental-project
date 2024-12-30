provider "aws" {
  region = "us-west-1"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "project.car"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
