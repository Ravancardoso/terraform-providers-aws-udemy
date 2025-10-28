# =====================
# VPC
# =====================
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
    Name = "igw-terraform-eks"
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
    Name = "public-subnet-a-terraform-eks"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.vpc-lab-aws.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b-terraform-eks"
  }
}

# Private Subnets
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.vpc-lab-aws.id 
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-a-terraform-eks"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.vpc-lab-aws.id 
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet-b-terraform-eks"
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
    Name = "public-rt-terraform-eks"
  }
}

resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.vpc-lab-aws.id 
  tags = {
    Name = "private-rt-a-terraform-eks"
  }
}

resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.vpc-lab-aws.id 
  tags = {
    Name = "private-rt-b-terraform-eks"
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


# Security Group


resource "aws_security_group" "security_group" {
  name          = "security-group-terraform"
  description   = "ec2 terraform security group"
  vpc_id        = aws_vpc.vpc-lab-aws.id 



  # Egress
  
  ingress { 
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "security-group-terraform"
    environment = "development"
  }
}