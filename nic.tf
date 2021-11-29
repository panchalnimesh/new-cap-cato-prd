# Create a network interface with an ip in the Public Subnet
resource "aws_network_interface" "Cato-vSocket-Wan-Interface-A" {
  subnet_id       = aws_subnet.Public-Subnet-A.id
  private_ips     = ["10.70.192.4"]
  security_groups = [aws_security_group.SG-Cato-vSocket.id]
}
 tags = {
    Name = "Cato-vSocket-Wan-Interface-A"
  }

resource "aws_network_interface" "Cato-vSocket-Wan-Interface-B" {
  subnet_id       = aws_subnet.Public-Subnet-B.id
  private_ips     = ["10.170.194.4"]
  security_groups = [aws_security_group.SG-Cato-vSocket.id]
}
 tags = {
    Name = "Cato-vSocket-Wan-Interface-B"
  }

# Create a network interface with an ip in the Private Subnet
resource "aws_network_interface" "Cato-vSocket-Mgmt-Interface-A" {
  subnet_id       = aws_subnet.App-Subnet-A.id
  private_ips     = ["10.70.200.4"]
  security_groups = [aws_security_group.SG-Cato-vSocket.id]
}
 tags = {
    Name = "Cato-vSocket-Mgmt-Interface-A"
  }

resource "aws_network_interface" "Cato-vSocket-Mgmt-Interface-B" {
  subnet_id       = aws_subnet.App-Subnet-B.id
  private_ips     = ["10.70.202.4"]
  security_groups = [aws_security_group.SG-Cato-vSocket.id]
 }
  tags = {
    Name = "Cato-vSocket-Mgmt-Interface-B"
  }

resource "aws_network_interface" "Cato-vSocket-LAN-Interface-A" {
  subnet_id       = aws_subnet.DB-Subnet-A.id
  private_ips     = ["10.92.196.4"]
  security_groups = [aws_security_group.SG-Cato-vSocket.id]
}
 tags = {
    Name = "Cato-vSocket-LAN-Interface-A"
  }

resource "aws_network_interface" "Cato-vSocket-LAN-Interface-B" {
  subnet_id       = aws_subnet.DB-Subnet-B.id
  private_ips     = ["10.92.198.4"]
  security_groups = [aws_security_group.SG-Cato-vSocket.id]
}
 tags = {
    Name = "Cato-vSocket-LAN-Interface-B"
  }

# Assign an elastic IP for Primary Cato vSocket
resource "aws_eip" "Primary-Cato-vSocket-EIP" {
  vpc                       = true
  network_interface         = aws_network_interface.Cato-vSocket-Wan-Interface-A.id
  associate_with_private_ip = "10.70.192.4"
  depends_on                = [aws_internet_gateway.Internet-Gateway]
}
 tags = {
    Name = "Primary-Cato-vSocket-EIP"
  }

# Assign an elastic IP for Secondary Cato vSocket
resource "aws_eip" "Secondary-Cato-vSocket-EIP" {
  vpc                       = true
  network_interface         = aws_network_interface.Cato-vSocket-Wan-Interface-B.id
  associate_with_private_ip = "10.70.194.4"
  depends_on                = [aws_internet_gateway.Internet-Gateway]
}
 tags = {
    Name = "Secondary-Cato-vSocket-EIP"
  }

# Assign an elastic IP for Primary NAT GW for Cato vSocket
resource "aws_eip" "NAT-GW-EIP-A" {
  vpc                       = true
  network_interface         = aws_network_interface.Cato-vSocket-Wan-Interface-A.id
  associate_with_private_ip = "10.70.192.6"
  depends_on                = [aws_internet_gateway.Internet-Gateway]
}
 tags = {
    Name = "NAT-GW-EIP-A"
  }

# Assign an elastic IP for Secondary NAT GW for Cato vSocket
resource "aws_eip" "NAT-GW-EIP-B" {
  vpc                       = true
  network_interface         = aws_network_interface.Cato-vSocket-Wan-Interface-B.id
  associate_with_private_ip = "10.70.194.6"
  depends_on                = [aws_internet_gateway.Internet-Gateway]
}
 tags = {
    Name = "NAT-GW-EIP-B"
  }
