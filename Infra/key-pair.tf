resource "aws_key_pair" "my_keypair" {
  key_name   = "${local.name}-keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}
