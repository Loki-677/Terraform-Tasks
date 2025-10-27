project  = "sample-dev"
region   = "us-east-2"
vpc_cidr = "10.0.0.0/16"
key_pair_name = "ohio"
public_subnets = {
  public-sub1 = { cidr = "10.0.10.0/24", az = "us-east-2a" }
}
private_subnets = {
  private-sub2 = { cidr = "10.0.11.0/24", az = "us-east-2b" }
}
instances = {
  dev-server = {
    ami_id        = "ami-0199d4b5b8b4fde0e"
    instance_type = "t2.micro"
    subnet_key    = "public-sub1"
    tags          = { Role = "web", Env = "dev" }
  }
}
