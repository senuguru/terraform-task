/*  Database Server	*/
resource "aws_security_group" "db" {
    name = "vpc_db"
    description = "ingress & egress connections."

    ingress { 
        from_port = 1433
        to_port = 1433
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "DB Server"
    }
}

resource "aws_instance" "db-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "us-east-1c"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.us-east-1c-private.id}"
    source_dest_check = false

    tags {
        Name = "DB Server"
    }
}

