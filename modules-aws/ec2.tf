resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "ec2" {
  ami                         = "ami-04f167a56786e4b09"
  instance_type               = "t3.nano"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.vpc.subnet_id
  vpc_security_group_ids      = [module.vpc.security_group_id]
  associate_public_ip_address = true


  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }



  provisioner "file" {
    source      = "/etc/script.sh"
    destination = "/etc/script.sh"
  }

  tags = {
    Name = "ec2-terraform"
  }
}
