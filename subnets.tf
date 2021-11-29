#Create Public Subnet A

resource "aws_subnet" "Public-Subnet-A" {

cidr_block = var.pubsubacidr

# public subnet A cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[0]

tags = {

Name = "Public-Subnet-A"

}

}

 

# Create Public Subnet B

resource "aws_subnet" "Public-Subnet-B" {

cidr_block = var.pubsubbcidr

# public subnet B cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[1]

tags = {

Name = "Public-Subnet-B"

}

}
 

#Create DB Private Subnet A

resource "aws_subnet" "DB-Subnet-A" {

cidr_block = var.dbsubacidr

# DB subnet A cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[0]

tags = {

Name = "DB-Subnet-A"

}

}

 

#Create DB Private Subnet B

resource "aws_subnet" "DB-Subnet-B" {

cidr_block = var.dbsubbcidr

# DB subnet B cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[1]

tags = {

Name = "DB-Subnet-B"

}

}

 

#Create App Private Subnet A

resource "aws_subnet" "App-Subnet-A" {

cidr_block = var.appsubacidr

# App subnet A cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[0]

tags = {

Name = "App-Subnet-A"

}

}


#Create App Private Subnet B

resource "aws_subnet" "App-Subnet-B" {

cidr_block = var.appsubbcidr

# App subnet A cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[1]

tags = {

Name = "App-Subnet-B"

}

}

#Create Web Private Subnet A

resource "aws_subnet" "Web-Subnet-A" {

cidr_block = var.websubacidr

# App subnet A cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[0]

tags = {

Name = "Web-Subnet-A"

}

}


#Create Web Private Subnet B

resource "aws_subnet" "Web-Subnet-B" {

cidr_block = var.websubbcidr

# App subnet A cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.Old-Cap-Cato-Prd.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[1]

tags = {

Name = "Web-Subnet-B"

}

}