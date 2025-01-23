
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"  
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "eks-vpc"
  }
}

# Creating  Public Subnet 
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"  #  CIDR block for the public subnet
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public-subnet"
  }
}

# Creating Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks-internet-gateway"
  }
}

# Creating Route Table for public subnet
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  #routing
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "eks-public-route-table"
  }
}

# public subnet assosiation 
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.main.id
}
