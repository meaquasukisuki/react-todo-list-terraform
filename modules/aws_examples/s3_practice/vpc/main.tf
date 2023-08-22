resource "aws_vpc" "A4L_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "A4L_vpc"
  }
}

resource "aws_subnet" "web_subnets" {
  count             = length(var.web_subnet_cidrs)
  vpc_id            = aws_vpc.A4L_vpc.id
  cidr_block        = element(var.web_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "A4L-web-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "db_subnets" {
  count             = length(var.db_subnet_cidrs)
  vpc_id            = aws_vpc.A4L_vpc.id
  cidr_block        = element(var.db_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = " A4L-db-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "app_subnets" {
  count             = length(var.app_subnet_cidrs)
  vpc_id            = aws_vpc.A4L_vpc.id
  cidr_block        = element(var.app_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "A4L-app-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "A4L_igw" {
  vpc_id = aws_vpc.A4L_vpc.id
}

resource "aws_route_table" "igw-rt" {
  vpc_id = aws_vpc.A4L_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.A4L_igw.id
  }

  tags = {
    Name = "A4L-igw-rt"
  }
}

resource "aws_route_table_association" "web_rt_associations" {
  count          = length(var.web_subnet_cidrs)
  subnet_id      = element(aws_subnet.web_subnets[*].id, count.index)
  route_table_id = aws_route_table.igw-rt.id
}

resource "aws_eip" "eips" {
  count = length(var.web_subnet_cidrs)
  tags = {
    Name = "A4L-web-ngw-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat_gateways" {
  count         = length(var.web_subnet_cidrs)
  subnet_id     = element(aws_subnet.web_subnets[*].id, count.index)
  allocation_id = element(aws_eip.eips[*].id, count.index)
  tags = {
    Name = "A4L-ngw-${count.index + 1}"
  }
}

resource "aws_route_table" "ngw-route-tables" {
  count  = length(var.web_subnet_cidrs)
  vpc_id = aws_vpc.A4L_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.nat_gateways[*].id, count.index)
  }
  tags = {
    Name = "ngw-rt-${count.index + 1}"
  }
}

locals {
  subnetA_ids = tolist([element(aws_subnet.app_subnets[*].id, 0), element(aws_subnet.db_subnets[*].id, 0)])
  subnetB_ids = tolist([element(aws_subnet.app_subnets[*].id, 1), element(aws_subnet.db_subnets[*].id, 1)])
  subnetC_ids = tolist([element(aws_subnet.app_subnets[*].id, 2), element(aws_subnet.db_subnets[*].id, 2)])
}

resource "aws_route_table_association" "subnetA-ngw-route-table-asso" {
  count          = length(var.private_subnetA_cidrs)
  subnet_id      = element(local.subnetA_ids, count.index)
  route_table_id = element(aws_route_table.ngw-route-tables[*].id, 0)
}

resource "aws_route_table_association" "subnetB-ngw-route-table-asso" {
  count          = length(var.private_subnetB_cidrs)
  subnet_id      = element(local.subnetB_ids, count.index)
  route_table_id = element(aws_route_table.ngw-route-tables[*].id, 1)
}

resource "aws_route_table_association" "subnetC-ngw-route-table-asso" {
  count          = length(var.private_subnetC_cidrs)
  subnet_id      = element(local.subnetC_ids, count.index)
  route_table_id = element(aws_route_table.ngw-route-tables[*].id, 2)
}


