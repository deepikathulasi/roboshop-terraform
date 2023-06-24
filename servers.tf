data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  }

  #output "ami"{
  #value = data.aws_ami.centos.image_id
  #}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "frontend"{
value = aws_instance.frontend.public_ip
}



resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}
output "mongodb"{
value = aws_instance.mongodb.public_ip
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}
output "catalogue"{
value = aws_instance.catalogue.public_ip
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}
output "redis"{
value = aws_instance.redis.public_ip
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}
output "cart"{
value = aws_instance.cart.public_ip
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mysql"
  }
}
output "mysql"{
value = aws_instance.mysql.public_ip
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}
output "shipping"{
value = aws_instance.shipping.public_ip
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}
output "rabbitmq"{
value = aws_instance.rabbitmq.public_ip
}