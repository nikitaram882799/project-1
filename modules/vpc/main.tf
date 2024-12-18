resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
  
    tags = {
      Name = "${var.project_name}-vpc"
    }
}

resource "aws_subnet" "dev_public_subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.vpc.id
    cidr_block = element(var.public_subnet_cidr, count.index)
    availability_zone = element(var.us_az, count.index)

    tags = {
      Name =  "${var.project_name}-public-subnet-${count.index + 1}"
    }
    
}

resource "aws_subnet" "dev_private_subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.vpc.id
    cidr_block = element(var.private_subnet_cidr, count.index)
    availability_zone = element(var.us_az, count.index)

    tags = {
      Name = "${var.project_name}-private-subnet${count.index + 1}"
    }
}

resource "aws_internet_gateway" "vpc_igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.project_name}-igw"
    }
  
}

resource "aws_route_table" "dev_public_route_table" {
    vpc_id = aws_vpc.vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc_igw.id
    }
  
    tags = {
        Name = "${var.project_name}-public-rt"
    }
}

resource "aws_route_table_association" "dev_public_route_table_association" {

  count            = length(aws_subnet.dev_public_subnet)
  subnet_id        = aws_subnet.dev_public_subnet[count.index].id
  route_table_id   = aws_route_table.dev_public_route_table.id
}


resource "aws_route_table" "dev_private_route_table" {
    vpc_id = aws_vpc.vpc.id
  
    tags = {
        Name = "${var.project_name}-private-rt"
    }
}

resource "aws_route_table_association" "dev_private_route_table_association" {
    count          = length(aws_subnet.dev_private_subnet)
    subnet_id      = aws_subnet.dev_private_subnet[count.index].id
    route_table_id = aws_route_table.dev_private_route_table.id
    
}



