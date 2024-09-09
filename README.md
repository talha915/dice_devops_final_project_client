# Project Overview
This project involves setting up a client-server architecture using Docker, deploying the containers on AWS EC2 instances, and automating the deployment process using CI/CD pipelines and Terraform.

# 1. Docker Setup
    ##     1.1 Base Image
    Choose an appropriate base image from the Official Images list.

# 1.2 Dockerfile for Client Container
    Created a Dockerfile for the client container with the following specifications:

# - Volume Mounting:
    - Used a volume named clientvol and mounted it at /clientdata in the container.
Package Installation:
Installed necessary packages and dependencies required for the client application.
Client Application:
Functionality:
Connects to the server and receives a file.
Saves the received file in the /clientdata directory.
Verifies the file's integrity by checking the received checksum.
#  1.3 Docker Compose
Used Docker Compose to define and run the client container.

2. AWS EC2 Instances
2.1 EC2 Instances
Created two AWS EC2 instances (VMs):
Server Container: Hosting the server container.
Client Container: Hosting the client container.
Instance Type: t2.micro (AWS Free Tier).
2.2 VPC and Subnets
Configured the VPC and subnets to allow communication between the two EC2 instances.
2.3 Terraform
Used Terraform for infrastructure automation.
3. Git Repositories and CI/CD
3.1 Repositories
Created two separate Git repositories for the server and client codebases.
3.2 CI/CD Pipelines
Set up CI/CD pipelines for both repositories to:
Push Images: Push images to a public registry like Docker Hub.
Private Git Runners: Configure the corresponding VMs as private Git runners.
Deployment:
Update the image tag in Docker Compose.
Pull the new image and deploy it as part of the CD process.
3.3 Email Notifications
Integrated email notifications for CI/CD pipeline events.
