resource "aws_instance" "master" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_pair
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/../../scripts/install-jenkins-master.sh")
  tags = { Name = "${var.project}-jenkins-master" }
}

