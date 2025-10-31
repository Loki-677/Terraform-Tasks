region                = "us-east-2"
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidr    = "10.0.1.0/24"
availability_zone     = "us-east-2a"
project               = "jenkins-poc"
key_pair              = "ohio"

master_ami            = "ami-0199d4b5b8b4fde0e" # Amazon Linux 2023 AMI in your region
slave_ami             = "ami-0199d4b5b8b4fde0e"
master_instance_type  = "t3.medium"
slave_instance_type   = "t3.micro"


