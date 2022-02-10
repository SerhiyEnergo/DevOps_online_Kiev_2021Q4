 create webserver in aws
# provider and redion in file ami_instance
resource "aws_instance" "webserver" {
  ami                    = "ami-0d527b8c289b4af7f" #ubuntu server
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webinstance.id]

  tags = {
    Name    = "WebServer for site"
    Owner   = "Student Serhiy"
    Project = "Create with Terrform"
  }
}

