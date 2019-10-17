resource "aws_vpc" "mainVpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "main"
    #Location = "bhubaneshwar"
  }
}

resource "aws_subnet" "subnet" {
 # count = "${length(data.aws_availability_zones.azs.names)}"
 # availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "Main"
  }
}

output "vpc_id"{
	value = "${aws_vpc.mainVpc.id}"
}

output "subnet_id"{
        value = "${aws_subnet.subnet.id}"
}

