 resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = merge(var.tags,{
          Name = "timing-VPC"
          })

}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.public.id
  cidr_block = var.public_subnet_cidr

  tags = merge(var.tags,{
          Name = "timing-subnet-public"
          })
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.public.id
  cidr_block = "10.0.2.0/24"

  tags = merge(var.tags,{
           Name = "timing-subnet-private"
           })
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.public.id

  tags = merge(var.tags,{
             Name = "timing-igw"
             })
}
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.public.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }



  tags = merge(var.tags,{
          Name = "timing-public-rt"
          })
}
resource "aws_eip" "auto-eip" {

}
/*  resource "aws_nat_gateway" "nat" {
 allocation_id = aws_eip.auto-eip.id
 subnet_id     = aws_subnet.private.id
  tags = var.tags
   # to ensure proper ordering, it is recommended to add an explicit dependency
      # on the internet gateway for the vpc.
     depends_on = [aws_internet_gateway.igw]
   }
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.public.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = var.tags
} */
resource "aws_route_table_association" "public-table-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "private-table-association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}