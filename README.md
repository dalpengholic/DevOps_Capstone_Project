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
This is the captone project of Cloud DevOps Engineer Nanodegree Program by Udacity. The goal of the project is to create a Jenkins pipeline to do blue/green deployment for a simple website deployed in AWS EKS. 

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

<a name="file_structure"></a>
## File Structure
```
├── Blue
│   ├── Dockerfile.blue
│   └── index.html
├── Dockerfile
├── Green
│   ├── Dockerfile.green
│   └── index.html
├── Infra
│   ├── 0410-CapstoneEKSCluster.yml
│   └── 0410-CapstoneEKSNodes.yml
├── Jenkinsfile
├── README.md
├── images
│   ├── 1_1_Launch_EC2_Instance(Userdata).png
│   ├── 1_2_Launch_EC2_Instance(SG).png
│   ├── 1_3_Launch_EC2_Instance(SSH).png
│   ├── 1_4_Launch_EC2_Instance(Docker).png
│   ├── 1_5_Launch_EC2_Instance(Jenkins1).png
│   ├── 1_6_Launch_EC2_Instance(bashrc).png
│   ├── 1_7_Launch_EC2_Instance(BlueOcean1).png
│   ├── 1_8_Launch_EC2_Instance(jenkins2).png
│   ├── 2_1_CI:CD(BlueOcean1).png
│   ├── 2_2_CI:CD(tidy).png
│   ├── 2_3_CI:CD(DockerCredential).png
│   ├── 2_4_CI:CD(PushImages).png
│   ├── 2_5_CI:CD(SetupforEKS).png
│   ├── 3_1_Infra(CloudFormation).png
│   ├── 3_1_Infra(CloudFormation1).png
│   ├── 3_1_Infra(CloudFormation2).png
│   ├── 3_1_Infra(EKS1).png
│   ├── 3_1_Infra(EKS2).png
│   ├── 3_1_Infra(Nodes).png
│   ├── 3_1_Infra(eksctl).png
│   ├── 4_1_Deployment(Jenkins1).png
│   ├── 4_2_Deployment(Jenkins2).png
│   ├── 4_3_Deployment(Jenkins3).png
│   ├── 4_4_Deployment(Jenkins4).png
│   ├── 4_5_Deployment(Jenkins5).png
│   ├── 5_1_Deployment(dockerhub_blue).png
│   ├── 5_2_Deployment(dockerhub_green).png
│   ├── 5_3_Deployment(kubectl).png
│   ├── 5_4_Deployment(Blue).png
│   ├── 5_5_Deployment(Green).png
│   └── README.md
├── myapp-blue.yml
├── myapp-green.yml
└── myapp-service.yml
```

<a name="results"></a>
## Results
![BlueDeployment](https://github.com/dalpengholic/DevOps_Capstone_Project/blob/master/images/5_4_Deployment(Blue).png)
![GreenDeployment](https://github.com/dalpengholic/DevOps_Capstone_Project/blob/master/images/5_5_Deployment(Green).png)

<a name="license"></a>
## LICENSE
![LICENSE]https://github.com/dalpengholic/DevOps_Capstone_Project/blob/master/LICENSE
