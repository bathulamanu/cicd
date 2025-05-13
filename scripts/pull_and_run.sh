#!/bin/bash

# Variables
REPO=495599757751.dkr.ecr.us-east-1.amazonaws.com/admin
IMAGE_TAG=$(aws ssm get-parameter --name "/admin/image_tag" --with-decryption --region us-east-1 --query "Parameter.Value" --output text || echo "latest")

# Login to ECR
$(aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $REPO)

# Stop and remove old container if it exists
docker stop admin || true
docker rm admin || true

# Pull and run new container
docker pull $REPO:$IMAGE_TAG
docker run -d --name admin -p 80:80 $REPO:$IMAGE_TAG
