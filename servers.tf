data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  }

  #output "ami"{
  #value = data.aws_ami.centos.image_id
  #}
   data "aws_security_group" "allow-all" {
      name = "allow-all"
      id = var.security_group_id
    }

  variable "instance_type"{
  default="t3.micro"
  }


#frontend
resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[data.aws_security_group.allow-all.id]

  tags = {
    Name = "frontend"
  }
}
output "frontend"{
value = aws_instance.frontend.public_ip
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "frontend.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.frontend.private_ip]
}

#mongodb
resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
    vpc_security_group_ids =[data.aws_security_group.allow-all.id]
  tags = {
    Name = "mongodb"
  }
}
output "mongodb"{
value = aws_instance.mongodb.public_ip
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "mongodb.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.mongodb.private_ip]
}

#catalogue
resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
instance_type = var.instance_type
  vpc_security_group_ids =[data.aws_security_group.allow-all.id]
  tags = {
    Name = "catalogue"
  }
}
output "catalogue"{
value = aws_instance.catalogue.public_ip
}
resource "aws_route53_record" "catalogue" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "catalogue.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.catalogue.private_ip]
}

#redis
resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
    vpc_security_group_ids =[data.aws_security_group.allow-all.id]
  tags = {
    Name = "redis"
  }
}
output "redis"{
value = aws_instance.redis.public_ip
}
resource "aws_route53_record" "redis" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "redis.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.redis.private_ip]
}

#cart
resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
    vpc_security_group_ids =[data.aws_security_group.allow-all.id]
   tags = {
    Name = "cart"
  }
}
output "cart"{
value = aws_instance.cart.public_ip
}
resource "aws_route53_record" "cart" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "cart.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.cart.private_ip]
}

#mysql
resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
 instance_type = var.instance_type
   vpc_security_group_ids =[data.aws_security_group.allow-all.id]
   tags = {
    Name = "mysql"
  }
}
output "mysql"{
value = aws_instance.mysql.public_ip
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "mysql.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.mysql.private_ip]
}

#shipping

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
instance_type = var.instance_type
  vpc_security_group_ids =[data.aws_security_group.allow-all.id]
  tags = {
    Name = "shipping"
  }
}
output "shipping"{
value = aws_instance.shipping.public_ip
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "shipping.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.shipping.private_ip]
}

#rabbitmq
resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
    vpc_security_group_ids =[data.aws_security_group.allow-all.id]


  tags = {
    Name = "rabbitmq"
  }
}
output "rabbitmq"{
value = aws_instance.rabbitmq.public_ip
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z0458836EHR8MPWSFHZ5"
  name    = "rabbitmq.devops1008.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.rabbitmq.private_ip]
}