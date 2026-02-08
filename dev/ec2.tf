resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("${path.module}/files/aws-key.pub")
}


# EC2  
resource "aws_instance" "ec2" {
  ami                         = "ami-0360c520857e3138f"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.private_a.id
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  vpc_security_group_ids      = [aws_security_group.security_group_ec2.id]
  associate_public_ip_address = false


  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/files/aws-key.pub")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ec2_setup.sh",
      "/tmp/script.sh args",
    ]
  }



  provisioner "file" {
    source      = "/etc/ec2_setup.sh"
    destination = "/etc/ec2_setup.sh"
  }

  tags = merge(
    local.default_tags,
    local.environment_tags,
    {
      Name = "lab-ec2-dev"
    }
  )
}
