resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}


/*  Public Subnet-1	*/
resource "aws_subnet" "us-east-1a-public" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_1_cidr}"
    availability_zone = "us-east-1a"

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table" "us-east-1a-public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "us-east-1a-public" {
    subnet_id = "${aws_subnet.us-east-1a-public.id}"
    route_table_id = "${aws_route_table.us-east-1a-public.id}"
}

/*  EIP	*/

resource "aws_eip" "example" {
  vpc = true
}


/*  NatGateway	*/
resource "aws_nat_gateway" "gw" {
    allocation_id = "${aws_eip.example.id}"
    subnet_id     = "${aws_subnet.us-east-1a-public.id}"

  tags = {
    Name = "gw NAT"
  }
}

/*  Private Subnet	*/
resource "aws_subnet" "us-east-1c-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us-east-1c"

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "us-east-1c-private" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id  = "${aws_nat_gateway.gw.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "us-east-1c-private" {
    subnet_id = "${aws_subnet.us-east-1c-private.id}"
    route_table_id = "${aws_route_table.us-east-1c-private.id}"
}

