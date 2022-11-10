resource "aws_vpc" "demovpc" {
  cidr_block = var.vpc-cidrblock
  tags = {
    Name = var.vpc-tag-name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    Name = var.igw-tag-name
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.demovpc.id
  cidr_block = var.publicsubnet-cidrblock
  tags = {
    Name = var.publicsub-tag-name
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.demovpc.id
  cidr_block = var.privatesubnet-cidrblock
  tags = {
    Name = var.privatesub-tag-name
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block = var.open-cidrblock
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.publicRT-tag-name
  }
}

resource "aws_route_table_association" "publicRT-assosciation" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_eip" "elasticip" {
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.privatesubnet.id
  tags = {
    Name = var.natgateway-tag-name
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block     = var.open-cidrblock
    nat_gateway_id = aws_nat_gateway.natgateway.id
  }
  tags = {
    Name = var.privateRT-tag-name
  }
}

resource "aws_route_table_association" "privateRT-assosciation" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privateRT.id
}

resource "aws_security_group" "sg" {
  name        = "demosg"
  description = "Allow port 22 for ssh into ec2 instance"
  vpc_id      = aws_vpc.demovpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.open-cidrblock]
  }
  tags = {
    Name = var.sg-tag-name
  }
}