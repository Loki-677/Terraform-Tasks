variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "project" {
  description = "Project name prefix"
  type        = string
}
variable "create_internet_gateway" {
  default = true
}

