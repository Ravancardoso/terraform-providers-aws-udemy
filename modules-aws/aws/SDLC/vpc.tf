
# VPC

resource "aws_vpc" "vpc-lab-aws" { 
  cidr_block            = "10.0.0.0/16"
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
    Name = "vpc-lab-aws" 
  }
}


# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-lab-aws.id

  tags = {
    Name = "igw-terraform-lab-aws"
  }
}


# Subnets

# Public Subnets
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.vpc-lab-aws.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a-terraform-lab-aws"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.vpc-lab-aws.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b-terraform-lab-aws"
  }
}

# Private Subnets
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.vpc-lab-aws.id 
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-a-terraform-lab-aws"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.vpc-lab-aws.id 
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet-b-terraform-lab-aws"
  }
}


# Route Tables

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc-lab-aws.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt-terraform-lab-aws"
  }
}

resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.vpc-lab-aws.id 
  tags = {
    Name = "private-rt-a-terraform-lab-aws"
  }
}

resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.vpc-lab-aws.id 
  tags = {
    Name = "private-rt-b-terraform-lab-aws"
  }
}


# Route Table Association

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_b.id
}


# NAT Gateways

resource "aws_eip" "nat_a" {
    tags = { Name = "nat-eip-a-terraform-lab" }
}

resource "aws_eip" "nat_b" {
  tags = { Name = "nat-eip-b-terraform-lab" }
}

resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "nat-gateway-a-terraform-lab"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "nat-gateway-b-terraform-lab"
  }

  depends_on = [aws_internet_gateway.igw]
}


# Rotas Privadas via NAT

resource "aws_route" "private_a_route" {
  route_table_id         = aws_route_table.private_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_a.id
}

resource "aws_route" "private_b_route" {
  route_table_id         = aws_route_table.private_b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_b.id
}


# Security Group for EC2


resource "aws_security_group" "security_group_ec2" {
  name        = "security-group-ec2-lab-aws"
  description = "Permitir todo o trafego de saida via NAT Gateway"
  vpc_id      = aws_vpc.vpc-lab-aws.id 

 
  # Ingress
 
  ingress { 
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.28.48.0/20"] 
  }

  
  # Egress
  
  egress { 
    description = "Permitir todo o tráfego de saída (Via NAT Gateway)"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "security-group-ec2-lab-aws"
    environment = "development"
  }
}



# Security Group for RDS

resource "aws_security_group" "security_group_rds" {
  name        = "security-group-rds-lab-aws"
  description = "Security Group for RDS"
  vpc_id      = aws_vpc.vpc-lab-aws.id

  
  # Ingress
  

  ingress {
    description     = "Permitir conexão MySQL da EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.security_group_ec2.id] 
  }


   tags = {
    Name        = "security-group-rds-lab-aws"
    environment = "development"
  }
}