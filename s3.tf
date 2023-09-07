

resource "aws_s3_bucket" "remote_backend_bucket" {
  bucket = "islam-terraform-backend-bucket421035169433" # Replace with your desired bucket name
  acl    = "private"

  versioning {
    enabled = true
  }
}

output "bucket_name" {
  value = aws_s3_bucket.remote_backend_bucket.id
}
