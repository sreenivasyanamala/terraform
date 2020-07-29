variable "region" {
        description = "enter region"
        type = string
}

variable "profile" {
    description = "AWS credentials profile you want to use"
    type = string
}

variable "domain_name" {
  description = "enter domain name"
  type        = string
}

variable "elasticsearch_version" {
  description = "enter elastic search version"
  type        = string
}

variable "instance_count" {
  description = "enter data node count"
  type        = string
}

variable "master_instance_type" {
  description = "enter master node size"
  type        = string
}

variable "instance_type" {
  description = "enter data node size"
  type        = string
}


variable "volume_size" {
  description = "enter volume size"
  type        = string
}



variable "subnetid_1" {
  description = "enter subnet1"
  type        = string
}

variable "subnetid_2" {
  description = "enter subnet2"
  type        = string
}

variable "security_group_id" {
  description = "enter security group id"
  type        = string
}





