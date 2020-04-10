# Udacity Cloud DevOps Engineer Nanodegree Program

## Capstone Project

## Table of Contents

1. [About the Project](#about_the_project)
2. [General Steps](#general_steps)
3. [Project Requirement](#project_requirement)
4. [File Structure](#file_structure)
5. [Results](#results)
6. [License](#license)

<a name="about_the_project"></a>
## About the Project
This is the captone project of Cloud DevOps Engineer Nanodegree Program by Udacity. The goal of the project is to create Jenkins pipeline to do blue/green deployment for a simple website deployed in AWS EKS. 

<a name="general_steps"></a>
## General Steps
1. Create an EC2 instance as a Jenkins master box to create CI/CD pipeline
2. Implement CloudFormation to deploy a kubernetes cluster
3. Deploy blue and green websites in AWS EKS using kubectl

<a name="project_requirement"></a>
## Project Requirement
- EC2 instance (us-west-2)
  - Ubuntu Server 18.04 LTS (HVM), more than t2.small, everything goes defualt value except User data
  - in User data type below to install `Jenkins`, `tidy` and `docker`.
  ```
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install default-jdk wget -y
  cd /home/ubuntu
  wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  sudo apt-get update -y
  sudo apt-get install jenkins tidy -y
  sudo systemctl status jenkins
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  ```


