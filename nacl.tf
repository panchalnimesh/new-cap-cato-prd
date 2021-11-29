# Create Network Public Subnets

resource "aws_network_acl" "Public" {
  vpc_id = aws_vpc.aws_vpc.New-Cap-Cato-Prd.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 21
    to_port    = 22
  }

  ingress {
    protocol   = "udp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "udp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  tags = {
    Name = "Public"
  }
}

# Create Network ACL for WebApp Subnets

resource "aws_network_acl" "WebApp" {
  vpc_id = aws_vpc.aws_vpc.New-Cap-Cato-Prd.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = -1
    to_port    = -1
  }

  egress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "10.70.192.0/20"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "10.70.192.0/20"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "-1"
    rule_no    = 120
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "-1"
    rule_no    = 130
    action     = "allow"
    cidr_block = "172.16.0.0/12"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "-1"
    rule_no    = 140
    action     = "allow"
    cidr_block = "192.168.0.0/16"
    from_port  = -1
    to_port    = -1
  }
  tags = {
    Name = "WebApp"
  }
}

# Create Network ACL for DB Subnets

resource "aws_network_acl" "DB" {
  vpc_id = aws_vpc.aws_vpc.New-Cap-Cato-Prd.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = -1
    to_port    = -1
  }

 
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 3368
    to_port    = 3368
  }

  ingress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "-1"
    rule_no    = 120
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "-1"
    rule_no    = 130
    action     = "allow"
    cidr_block = "172.16.0.0/12"
    from_port  = -1
    to_port    = -1
  }

  ingress {
    protocol   = "-1"
    rule_no    = 140
    action     = "allow"
    cidr_block = "192.168.0.0/16"
    from_port  = -1
    to_port    = -1
  }
  tags = {
    Name = "DB"
  }
}