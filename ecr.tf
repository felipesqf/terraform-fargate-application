resource "aws_ecr_repository" "nodeapp-repository" {
  name                 = "myapp"
#   image_tag_mutability = "IMMUTABLE"
   provisioner "local-exec" {
    command = "cd my-app/api && aws ecr get-login-password --region REGION | docker login --username AWS --password-stdin ACCOUNT-ID.dkr.ecr.REGION.amazonaws.com && docker build -t myapp . && docker tag myapp:latest ACCOUNT-ID.dkr.ecr.REGION.amazonaws.com/myapp:latest && docker push ACCOUNT-ID.dkr.ecr.REGION.amazonaws.com/myapp:latest"
  }
}


# r
resource "aws_ecr_repository_policy" "nodeapp-repo-policy" {
  repository = aws_ecr_repository.nodeapp-repository.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
