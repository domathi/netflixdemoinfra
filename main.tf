provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 5
ami = "ami-0ddc798b3f1a5117e"
instance_type = "t2.medium"
key_name = "swikp"
vpc_security_group_ids = ["sg-02d39bf1d2150a0c6"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}
