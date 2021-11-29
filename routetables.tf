 #Public Route Table

resource "aws_route_table" "Public" {

vpc_id = aws_vpc.New-Cap-Cato-Prd.id

route {

cidr_block = "0.0.0.0/0"

gateway_id = aws_internet_gateway.Internet-Gateway.id

}

tags = {

Name = "Public"

}

}

 

#Associate Public Route Table to Public Subnets

resource "aws_route_table_association" "Public-Subnet-A" {

subnet_id = aws_subnet.Public-Subnet-A.id

route_table_id = aws_route_table.Public.id

}

 

resource "aws_route_table_association" "Public-Subnet-B" {

subnet_id = aws_subnet.Public-Subnet-B.id

route_table_id = aws_route_table.Public.id

}


#Private Route Table for DB Subnets

resource "aws_route_table" "Cato-vSocket-LAN-RT" {
  vpc_id = aws_vpc.New-Cap-Cato-Prd.id

  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = "tgw-0caa606d9c6aacd9e"
  }

  route {
    cidr_block = "10.0.0.0/8"
    transit_gateway_id = "tgw-0caa606d9c6aacd9e"
  }


  tags = {
    Name = "Cato-vSocket-LAN-RT"
  }
}

#Private Route Table for App Subnets

resource "aws_route_table" "Cato-vSocket-Mgmt-A-RT" {
  vpc_id = aws_vpc.New-Cap-Cato-Prd.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "nat_gateway_id.Primary-NAT-Gateway-A.id"
  }

   tags = {
    Name = "Cato-vSocket-Mgmt-A-RT"
  }
}

resource "aws_route_table" "Cato-vSocket-Mgmt-B-RT" {
  vpc_id = aws_vpc.New-Cap-Cato-Prd.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "nat_gateway_id.Primary-NAT-Gateway-B.id"
  }

   tags = {
    Name = "Cato-vSocket-Mgmt-B-RT"
  }
}



#Associate Private Route Table to Private Subnets

resource "aws_route_table_association" "DB-Subnet-A" {

subnet_id = aws_subnet.DB-Subnet-A.id

route_table_id = aws_route_table.Private-DB.id

}

 

resource "aws_route_table_association" "DB-Subnet-B" {

subnet_id = aws_subnet.DB-Subnet-B.id

route_table_id = aws_route_table.Private-DB.id

}

#Private Route Table for WebApp

resource "aws_route_table" "Private-WebApp-A" {
  vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = "tgw-0caa606d9c6aacd9e"
  }


  tags = {
    Name = "Private-WebApp-A"
  }
}

resource "aws_route_table" "Private-WebApp-B" {
  vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = "tgw-0caa606d9c6aacd9e"
  }


  tags = {
    Name = "Private-WebApp-B"
  }
}


resource "aws_route_table_association" "App-Subnet-A" {

subnet_id = aws_subnet.App-Subnet-A.id

route_table_id = aws_route_table.Private-WebApp-A.id

}

resource "aws_route_table_association" "App-Subnet-B" {

subnet_id = aws_subnet.App-Subnet-B.id

route_table_id = aws_route_table.Private-WebApp-B.id

}

resource "aws_route_table_association" "Web-Subnet-A" {

subnet_id = aws_subnet.Web-Subnet-A.id

route_table_id = aws_route_table.Private-WebApp-A.id

}

resource "aws_route_table_association" "Web-Subnet-B" {

subnet_id = aws_subnet.Web-Subnet-B.id

route_table_id = aws_route_table.Private-WebApp-B.id

}