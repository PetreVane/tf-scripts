

# Network Load Balancer Terraform Scripts

## Introduction
This repository contains Terraform scripts for setting up a network load balancer. The scripts are designed to help you quickly deploy a network load balancer within your cloud environment, using best practices for high availability and performance. Besides a network load balancer, this repository also contains scripts for creating the following  resources:
- a vpc with 2 public subnets + a route table and an internet gateway
- a launch template with a hard coded ami identifier which uses a bash script to launch a python web server listening for incoming requests on port 8080
- a security group which allows access to port 8080
- an autoscaling group which uses the launch template to deploy 2 ec2 instances in each public subnet
- a target group for the network load balancer. Instances in the autoscaling group are registered as targets
- a network load balancer that distributes traffic across instances in the target group. It specifies the subnets for the NLB.

## Prerequisites
Before you begin using these scripts, make sure you have the following:

- Terraform installed on your local machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).
- An AWS account with the necessary permissions to create network load balancers, and other related resources.
- AWS CLI configured on your machine. See the [AWS CLI documentation](https://aws.amazon.com/cli/) for installation and configuration instructions.

## How It Works

1. **VPC Creation**: The `vpc` module initializes a VPC where all the resources will be deployed.
2. **Security Group Setup**: The `security-group` module creates a security group within the VPC, which is later used by the launch template for EC2 instances.
3. **Launch Template Configuration**: The `launch-template` module defines the configuration for EC2 instances, including the AMI, instance type, and associated security group.
4. **Autoscaling Group Deployment**: The `autoscaling-group` module uses the launch template to create an autoscaling group. It ensures that the instances are spread across multiple subnets for high availability and registers them with the target group.
5. **Target Group Creation**: The `target-group` module creates a target group for the NLB to route traffic to. It is associated with the VPC.
6. **Network Load Balancer Setup**: Finally, the `network-load-balancer` module deploys an NLB in the specified subnets. It routes incoming traffic to the instances in the target group based on the configuration.

This setup provides a scalable and highly available infrastructure on AWS, leveraging a network load balancer to efficiently distribute traffic.

## Installation
To use these Terraform scripts, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/PetreVane/tf-scripts.git
   cd tf-scripts/network-load-balancer
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Create a Terraform Plan:**
   ```bash
   terraform plan
   ```

4. **Apply the Terraform Configuration:**
   ```bash
   terraform apply
   ```

## Contributing
Contributions to this project are welcome! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/AmazingFeature`).
3. Make your changes and commit them (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License - see the [LICENSE.md](/LICENSE.md) file for details.

## Contact
- **Petre Vane** - petre.vane@aws-dev.cloud
- Project Link: [GitHub - PetreVane/tf-scripts](https://github.com/PetreVane/tf-scripts/tree/main/network-load-balancer)
