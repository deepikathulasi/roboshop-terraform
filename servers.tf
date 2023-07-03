


resource "aws_instance" "instance" {
for_each=var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids =[data.aws_security_group.allow-all.id]

tags={
Name=each.value["name"]
}
provisioner "remote-exec"{
connection{
type ="ssh"
useer="centos"
password="DevOps321"
host=self.private_ip
}
inline = [
"rm-rf roboshop-shell",
"git clone https://github.com/venkatadeepikathulasi/Roboshop-shell.git",
"cd Roboshop-shell",
"sudo bash${each.value["name"]}.sh"]
}

resource "aws_route53_record" "records"{
     for_each = var.components
      zone_id ="Z0458836EHR8MPWSFHZ5"
     name     ="${each.value["name"]}.devops1008.online"
      type    ="A"
      ttl     =30
      records  =[aws_instance.instance[each.value["name"]].private_ip]
}

