variable "vpc-cidrblock" {
  type    = string
  default = "10.0.0.0/16"
}

variable "publicsubnet-cidrblock" {
  type    = string
  default = "10.0.1.0/24"
}

variable "privatesubnet-cidrblock" {
  type    = string
  default = "10.0.2.0/24"
}

variable "open-cidrblock" {
  type    = string
  default = "0.0.0.0/0"
}

variable "vpc-tag-name" {
  type    = string
  default = "demovpc"
}

variable "igw-tag-name" {
  type    = string
  default = "demoigw"
}

variable "publicsub-tag-name" {
  type    = string
  default = "demopublicsubnet"
}

variable "privatesub-tag-name" {
  type    = string
  default = "demoprivatesubnet"
}

variable "publicRT-tag-name" {
  type    = string
  default = "demopublicRT"
}

variable "natgateway-tag-name" {
  type    = string
  default = "demonatgateway"
}

variable "privateRT-tag-name" {
  type    = string
  default = "demoprivateRT"
}

variable "sg-tag-name" {
  type    = string
  default = "demosg"
}

variable "ami" {
  type    = string
  default = "ami-08c40ec9ead489470"
}

variable "ec2type" {
  type    = string
  default = "t2.micro"
}

variable "keypair" {
  type    = string
  default = "orchsky-demo"
}

variable "ec2-tag-name" {
  type    = string
  default = "demoec2"
}