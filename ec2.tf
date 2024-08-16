resource "aws_instance" "nextwork_prd" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

  tags = {
    Name = "nextwork-production-felipe"
    Env  = "production"
  }
  #   root_block_device {
  #     volume_type           = "gp3"
  #     volume_size           = 8
  #     delete_on_termination = true
  #   }
}

resource "aws_instance" "nextwork_dev" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

  tags = {
    Name = "nextwork-development-felipe"
    Env  = "development"
  }
  #   root_block_device {
  #     volume_type           = "gp3"
  #     volume_size           = 8
  #     delete_on_termination = true
  #   }
}