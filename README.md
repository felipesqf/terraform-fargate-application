# Terraform - Fargate - Node-Reacj Application
This is an Node-react application running on ECS Fargate containers and using S3 bucket for the React frontend. The whole application and infrastructure was deployed using terraform.<br><br>
​
This archtecture will create:<br>

- VPC<br>
- Subnets<br>
- Internet Gateway<br>
- NAT Gateway<br>
- S3 Bucket for the <br>
- Application Load Balancer<br>
- Fargate Cluster<br>
- Fargate Service<br>
- Task Definition<br>
- Auto Scaling Group<br>
- ECR Repository and image<br>

The VPC infrastructe is created using the following module:<br>
https://github.com/felipesqf/terraform-fargate

## Archtecture
![screenshot1](https://github.com/felipesqf/terraform-fargate-application/blob/main/React-Node_new.png) 


## Requirements
- AWS Account
- Route53 for domain record


## Authentication
Terraform uses the authentication configured in your AWS CLI, make sure you have access to your account configured in at least one profile before executing the deploy.


## Execution
- Configure AWS CLI
- Install Terraform
- Run terraform init
- Run terraform plan
- Run terraform apply


## Authors
Felipe Ferreira  <br><br>
Contact information:<br>
felipesqf@gmail.com<br>
Github: felipesqf<br>
+61 0406 021 252
​​  
