output "jenkins_master_public_ip" {
  value = module.jenkins_master.public_ip
}
output "jenkins_slave_public_ip" {
  value = module.jenkins_slave.public_ip
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "vpc_public_subnet_id" {
  value = module.vpc.public_subnet_id
}