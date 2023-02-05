provider "aws" {
  region = "ap-south-1"
}

resource "aws_ecs_cluster" "example" {
  name = "pavan-cluster"
}

resource "aws_ecs_task_definition" "example" {
  family = "example-task-definition"
  container_definitions = <<DEFINITION
[
  {
    "name": "example",
    "image": "nginx:latest",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 128,
    "cpu": 128
  }
]
DEFINITION
}

resource "aws_ecs_service" "example" {
  name            = "example-service"
  task_definition = aws_ecs_task_definition.example.arn
  cluster         = aws_ecs_cluster.example.id
  desired_count   = 1
}
