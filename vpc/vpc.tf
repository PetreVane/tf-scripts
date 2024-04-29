
resource "aws_vpc" "tf-fourth-custom-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "tf-fourth-custom-vpc"
  }
}

resource "aws_subnet" "tf-public-subnet-1" {
  vpc_id     = aws_vpc.tf-fourth-custom-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.az1
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.tf-fourth-custom-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet2"
  }
}
