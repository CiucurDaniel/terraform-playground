terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "team-members-${var.environment}-document-s3"

  tags = {
    Name        = "Team members bucket"
    Environment = var.environment
    Terraform = var.terraform
  }
}

resource "aws_s3_object" "object" {

  bucket = "team-members-${var.environment}-document-s3"
  key = "team-members-key.json"
  source = "team-members.json"
  server_side_encryption = "AES256"

  etag = fileexists("team-members.json") ? filemd5("team-members.json") : "0"
}