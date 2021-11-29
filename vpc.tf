#vpc resource

resource "aws_vpc" "New-Cap-Cato-Prd" {

cidr_block = var.vpccidr

# cidr block iteration found in the terraform.tfvars file

tags = {

Name = "New-Cap-Cato-Prd"
}

}
#Create Transit Gateway Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "New-Cap-Cato-Prd" {
  subnet_ids         = [aws_subnet.DB-Subnet-A.id, aws_subnet.DB-Subnet-B.id]
  transit_gateway_id = "tgw-0caa606d9c6aacd9e"
  vpc_id             = aws_vpc.New-Cap-Cato-Prd.id
  tags = {

Name = "New-Cap-Cato-Prd"
}
}