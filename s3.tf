resource "aws_s3_bucket" "react_bucket" {
  bucket = "react-app-final-challenge"
  acl    = "public-read-write"
  force_destroy = true  
  policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::react-app-final-challenge/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  provisioner "local-exec" {
    command = "cd my-app/client && npm run build && aws s3 sync build s3://react-app-final-challenge"
  }
}

output "website_domain" {
  value = "${aws_s3_bucket.react_bucket.website_domain}"
}

output "website_endpoint" {
  value = "${aws_s3_bucket.react_bucket.website_endpoint}"
}