region  = "us-east-2"
project = "sample"
key_pair_name = "ohio"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  public-sub1 = { cidr = "10.0.10.0/24", az = "us-east-2a" }
}

private_subnets = {
  private-sub2 = { cidr = "10.0.11.0/24", az = "us-east-2b" }
}

instances = {
  web-server = {
    ami_id        = "ami-0199d4b5b8b4fde0e" #Acual AMI For instance ami-0199d4b5b8b4fde0e
    instance_type = "t2.micro"
    subnet_key    = "public-sub1"
    tags          = { Role = "web", Env = "dev" }
  }
}

# terraform import 'aws_instance.ec2["web-server"]' i-066d11972138363db
# terraform import 'aws_vpc.main' vpc-0288b1f25f6d94c4f
# terraform import 'aws_internet_gateway.igw' igw-063402c5814fa5037
# terraform import 'aws_subnet.public["public-sub1"]' subnet-096e5fdb289a38e63
# terraform import 'aws_subnet.private["private-sub2"]' subnet-0f707463fd980f8a5
# terraform import 'aws_route_table.public' rtb-0f0c57f5443eeccf6
