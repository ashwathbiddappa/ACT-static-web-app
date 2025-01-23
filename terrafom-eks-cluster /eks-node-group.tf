# Create EKS Node Group 
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "my-node-group"
  node_role_arn   = iam role arn

  subnet_ids = [aws_subnet.public.id]
  node_group_security_group_ids = [aws_security_group.eks_cluster.id]


  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t3.micro"]
}
