provider "aws" {

#your region where your VPC will be created

region = "ap-southeast-1"

#location of your credentials file hosting the Secret Key and Secret Access Key (and sometimes Session Token)

shared_credentials_file = "C:\\Users\\npanchal\\.aws\\credentials"

#name of the profile in your credential file

profile = "newcapcatoprd"

#Default Tags 

default_tags {
   tags = {

"sph:managed-by" = "ecs"
"map-migrated" = "d-server-02wyg7c29l4iwr"
"sph:env" = "Prd"
"sph:scaling" = "static"
"sph:creator-name" = "Nimesh Panchal"
"sph:creator-email" = "npanchal@sph.com.sg"
"sph:appIC" = "Jaffery Toh"
"sph:appteam" = "infra-network-team"
"sph:owner" = "infra"
"sph:cost-centre" = "1691"
"sph:product" = "Cato"
   }
 }
}