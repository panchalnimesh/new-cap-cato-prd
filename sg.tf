# Create Security Group to allow port 443, 1024-65535 TCP and UDP
resource "aws_security_group" "SG-Cato-vSocket" {
  name        = "SG-Cato-vSocket"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.New-Cap-Cato-Prd.id
  ingress {
    description = "HTTPS TCP to Connect Cato vSocket"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS UDP to Connect Cato vSocket"
    from_port   = 443
    to_port     = 443
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow High Port UDP to Connect Cato vSocket"
    from_port   = 1024
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    description = "Allow High Port TCP to Connect Cato vSocket"
    from_port   = 1024
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Public"  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SG-Cato-vSocket"
  }
}
