# Automated AWS Infrastructure Setup with Terraform

## Overview
This project automates the provisioning of AWS infrastructure using Terraform as an Infrastructure-as-Code (IaC) tool. It ensures consistent and scalable deployment across environments by defining resources such as VPCs, subnets, EC2 instances, S3 bucket and load balancers.

## Project Structure
```
.
├── main.tf          # Defines the core AWS infrastructure resources
├── provider.tf      # Configures the AWS provider
├── userdata.sh      # User data script for configuring EC2 instances
├── userdata1.sh     # Additional user data script (if needed)
├── variable.tf      # Defines input variables for reusability
```

## Infrastructure Components
### 1. **VPC & Networking**
- Creates a **Virtual Private Cloud (VPC)** with custom CIDR blocks.
- Defines **public subnets**.
- Configures **Internet Gateway** for public internet access.
- Sets up **Route Tables** to control network traffic.


![Screenshot from 2025-03-19 17-19-38](https://github.com/user-attachments/assets/59b948c7-27c5-4082-998d-ae85a5df8aa6)


### 2. **Compute Resources**
- Launches **EC2 instances** with user data for automated setup.
  
![Screenshot from 2025-03-19 17-34-23](https://github.com/user-attachments/assets/c3e12c15-8977-42bd-986c-6947f676d045)

  
![Screenshot from 2025-03-19 17-35-05](https://github.com/user-attachments/assets/7b934684-4f78-4f3b-9f11-c38cc2965c00)

- Attaches **Security Groups** to control inbound/outbound traffic.


### 3. **Load Balancing & Storage**
- Deploys an **Application Load Balancer (ALB)** for traffic distribution.
  
![Screenshot from 2025-03-19 17-21-41](https://github.com/user-attachments/assets/78c36ff8-60d4-4c45-b6cc-47d216d14778)

![Screenshot from 2025-03-19 17-38-20](https://github.com/user-attachments/assets/662fd6a4-23c7-4273-93ea-47a306e9334e)

![Screenshot from 2025-03-19 17-38-12](https://github.com/user-attachments/assets/56350d1c-2cbf-465e-b3ca-3ebe8d400a14)


- Configures **S3 bucket integration** for storage.

![Screenshot from 2025-03-19 17-35-32](https://github.com/user-attachments/assets/174126da-3684-4ca3-adc2-f8c2455de781)

- **Integrated S3 for EC2 Logs**: Configured EC2 instances to send logs to an S3 bucket for centralized log management and analysis.
  
![Screenshot from 2025-03-19 17-41-19](https://github.com/user-attachments/assets/489515fe-e120-4872-b577-3a0f14ec9798)

![Screenshot from 2025-03-19 17-41-51](https://github.com/user-attachments/assets/9ea6f2f2-4aca-4d13-9fae-d4a644ccdd19)

## Setup Instructions
### 1. **Install Terraform**
Ensure Terraform is installed on your system:
```sh
terraform version
```
If not installed, follow [Terraform Installation Guide](https://developer.hashicorp.com/terraform/downloads).

### 2. **Initialize Terraform**
Run the following command to initialize Terraform and download required providers:
```sh
terraform init
```

### 3. **Validate & Plan**
Validate the configuration:
```sh
terraform validate
```
Generate an execution plan:
```sh
terraform plan
```

### 4. **Apply Configuration**
Deploy the infrastructure:
```sh
terraform apply -auto-approve
```
![Screenshot from 2025-03-19 17-18-20](https://github.com/user-attachments/assets/e507381f-0c6d-45d4-abfb-dd76ef759a81)


### 5. **Destroy Infrastructure**
To delete all resources:
```sh
terraform destroy -auto-approve
```
![Screenshot from 2025-03-19 17-49-57](https://github.com/user-attachments/assets/5ca30bdf-5791-48c0-8d31-a77c5bbf0ed1)


## Best Practices Implemented
- **Modular Code:** Uses `variable.tf` for reusability and scalability.
- **State Management:** Ensures infrastructure consistency with Terraform state.
- **Security Best Practices:** Implements security groups and IAM roles.
- **Centralized Logging:** EC2 logs are sent to S3 for monitoring and analysis.

## Future Enhancements
- Implement **Terraform modules** for better organization.
- Add **Terraform backend storage (S3 + DynamoDB)** for remote state management.
- Configure **CloudWatch monitoring** for EC2 and ALB.

---


