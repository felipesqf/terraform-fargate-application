variable "region" {
  type = string

}
variable "availability_zone" {
  default = ["ap-southeast-2a", "ap-southeast-2b"]

}
variable "vpc_cidr" {
  default = "10.200.0.0/16"

}

variable "secure_cidr" {
  default = ["10.200.4.0/24", "10.200.5.0/24"]

}

variable "private_cidr" {
  default = ["10.200.2.0/24", "10.200.3.0/24"]

}

variable "public_cidr" {
  default = ["10.200.0.0/24", "10.200.1.0/24"]

}

variable "number_resources" {
  default = 2
}

variable "vpc_name" {
  default = "FinalChallengeVPC-NodeReact"
}