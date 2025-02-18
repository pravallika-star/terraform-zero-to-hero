provider "aws" {
  region = "us-east-1"
}

#module "ec2_instance" {
  #source  = "terraform-aws-modules/ec2-instance/aws"
  #version = "5.7.1"

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  subnet_id      = "subnet-02b7248d03df5ecd6" 
}
