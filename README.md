

This solution involves setting up a web application in a Kubernetes cluster on Amazon EKS. The application consists of a static web page served using NGINX. 
The infrastructure and application are automated using Terraform, and basic monitoring (CPU, memory, and disk usage) is set up using Prometheus and Grafana.


1.    Docker Setup and Deployment
Create and Build Docker Image:

Dockerfile: we are using a simple HTML file served via NGINX.
Build the Docker Image: The Docker image is built using the following command:

docker build -t web-app .

Push to AWS ECR: Push the image to AWS ECR to make it available to our EKS cluster:

docker push <repository-url>/web-app

2.  Terraform Setup:

Initialize Terraform:

terraform init

Validate Terraform Configuration:

terraform plan

Apply Terraform Configuration:

terraform apply

This step provisions the following AWS resources:
VPC with a public subnet.
EKS Cluster with IAM roles.
EKS Node Group to run the worker nodes.

  3. Kubernetes Deployment
Deploy Web Application to EKS:
Deploy the application and service using kubectl:

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

   4.Monitoring with Prometheus and Grafana

Set Up Monitoring:
Install the Prometheus and Grafana stack using Helm as outlined in our setup.
Access Prometheus:

Access Prometheus UI via http://localhost:9090.

Access Grafana:

Access Grafana UI via http://localhost:8080.

   5.Verify Deployment

Verify Application and Service:
To check the pods and services created:

kubectl get pods
kubectl get svc

we will get the external IP of the load balancer, which we can access the application through:

http://extenal ip

Custom Domain Setup
Set Up Custom Domain with Route 53:
we can use AWS Route 53 for DNS management to map the load balancer's external IP to a custom doma
