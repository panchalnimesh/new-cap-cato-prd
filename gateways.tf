resource "aws_internet_gateway" "Internet-Gateway" {

vpc_id = aws_vpc.New-Cap-Cato-Prd.id

tags = {

Name = "Internet-Gateway"

}

}

resource "aws_nat_gateway" "Primary-NAT-Gateway-A" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.Public-Subnet-A.id
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Primary-NAT-Gateway-A"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.Internet-Gateway]
}

resource "aws_nat_gateway" "Primary-NAT-Gateway-B" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.Public-Subnet-B.id
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Secondary-NAT-Gateway-B"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.Internet-Gateway]
}