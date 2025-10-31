variable "ami" {
  description = "AMI ID for the Jenkins Master EC2 instance"
  type        = string
  }

variable "instance_type" {
  description = "Instance type for the Jenkins Master EC2 instance"
   type = string
  }

variable "subnet_id" {
  description = "Subnet ID where the Jenkins Master EC2 instance will be launched"
  type = string 
  }
variable "key_pair" {
  description = "Key pair name for SSH access to the Jenkins Master EC2 instance"
  type = string 
  }
variable "security_group_id" {
  description = "Security Group ID for the Jenkins Master EC2 instance"
  type = string 
  }
variable "project" {
  description = "Project name to tag the Jenkins Master EC2 instance"
  type = string 
  }

