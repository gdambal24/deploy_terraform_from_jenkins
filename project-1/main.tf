provider "aws"{
region     = "ap-south-1"
 
}

resource "aws_instance" "ec2_test" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t2.medium"

  subnet_id              = "subnet-086b9991f1e21ad7d"
  vpc_security_group_ids = ["sg-0a05f0c7278087163"]
  key_name               = "linux"
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "Admin-server"
  }

  user_data = file("test.sh")
}

output "publicIP" {
  value = aws_instance.ec2_test.public_ip
}

