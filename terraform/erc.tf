resource "aws_ecr_repository" "my_spring_app" {
  name                 = "my-spring-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "my-spring-app"
  }
}
