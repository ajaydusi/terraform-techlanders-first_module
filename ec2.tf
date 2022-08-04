variable "username" {
 type = string
 default = "gds"
}
variable "i_type" {
 type = string
 default = "t2.micro"
}
variable "ami" {
 type = string
 default = "ami-087c17d1fe0178315"
}

variable "key" {
 type = string
 default = "adusi-keypair"
}

resource "aws_instance" "myawsserver" {
  ami = var.ami
  instance_type = var.i_type
#  key_name = var.key
#  user_data = templatefile("/home/gagan/terraform/aws/first_demo/user_data.tftpl", { user = var.username})
  
  tags = {
    Name = upper("adusi")
    Env = upper("Dev")
  }
}

output "myawsserver-ip" {
  value = "${aws_instance.myawsserver.public_ip}"
}
