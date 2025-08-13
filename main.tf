provider "aws" {
  region = "ap-south-1"
}

variable "instance_names" {
  default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names) # Automatically match number of names
  ami                    = "ami-0120bca902526ae75"
  instance_type          = "t2.medium"
  key_name               = "kskp"
  vpc_security_group_ids = ["sg-0fceeb40d5eee0ade"]

  tags = {
    Name = var.instance_names[count.index]
  }
}

