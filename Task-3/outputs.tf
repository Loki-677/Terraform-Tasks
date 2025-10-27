output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = { for k, v in aws_subnet.public : k => v.id }
}

output "private_subnets" {
  value = { for k, v in aws_subnet.private : k => v.id }
}

output "instances" {
  value = {
    for k, v in aws_instance.ec2 :
    k => {
      id         = v.id
      private_ip = v.private_ip
      public_ip  = v.public_ip
    }
  }
}
