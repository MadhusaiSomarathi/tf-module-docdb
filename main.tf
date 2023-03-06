resource "aws_docdb_subnet_group" "default" {
  name       = "${var.env}-${var.name}-roboshop-docdb"
  subnet_ids = var.subnets

  tags = {
    Name = "${var.env}-${var.name}-roboshop-docdb"
  }
}

