# Create EKS Cluster 
resource "aws_eks_cluster" "main" {
  name     = "my-eks-cluster"
  role_arn =  IAm role ARN 

  vpc_config {
    subnet_ids = [aws_subnet.public.id]
  }

  tags = {
    Name = "eks-cluster"
  }
}
