# Udacity Cloud DevOps Engineer Nanodegree Program

## Capstone Project

## Table of Contents

1. [About the Project](#about_the_project)
2. [General Steps](#general_steps)
3. [Tools](#tools)
4. [File Structure](#file_structure)
5. [Results](#results)
6. [License](#license)

<a name="about_the_project"></a>
## About the Project
This is the captone project of Cloud DevOps Engineer Nanodegree Program by Udacity. The goal of the project is to create Jenkins pipeline to do blue/green deployment for a simple website deployed in AWS EKS. 

<a name="general_steps"></a>
## General Steps
1. Create an EC2 instance as a Jenkins master box to create CI/CD pipeline
2. Implement CloudFormation to create a kubernetes cluster using eksctl
3. Deploy blue and green websites in AWS EKS using kubectl
4. Edit selector in `myapp-service.yml` and apply it

<a name="Tools"></a>
## Tools
- EC2 instance (us-west-2)
  - Ubuntu Server 18.04 LTS (HVM), more than t2.small
  - Jenkins
  - Docker
  - tidy
  - Python3
  - AWS CLI
  - kubectl
- CloudFormation (console, AWS CLI, or eksctl)
- EKS



  


