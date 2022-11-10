# Plan
- To provision an AWS VPC with public and private subnets (1 of each)
- To provision ubuntu ec2 instance with docker and kubernetes cli installed
- For the installation of the tooling have a bash script

- VPC:
    - internet gateway
    - nat gateway (public)
    - 2 subnets (1 public / 1 private)
    - for public subnet it would have to target the igw
    - for private subent it would have to target nat gateway
    - routing tables:
        - associate public and private subnet routes
        - public route has to have public subnet target igw / subnet association (destination 0.0.0.0/0)
        - private route has to have private subnet target nat gateway / subnet associated (destination 0.0.0.0/0)
        - security group:
            - port 22 ssh open
- EC2:
    - image: ubuntu LTS
    - name
    - instance type
    - key pair
    - associate vpc to ec2 via subnet (auto assign public ip)
    - associate security group to vpc
    - bash script:
        - docker installed: [documentation](https://docs.docker.com/engine/install/ubuntu/)
        - kubernetes cli installed: [documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

## Verification
- Navigate to AWS console and verify 
- If we are able to connect to the ubuntu instance
- Verify if docker and kubernetes cli was installed to the machine