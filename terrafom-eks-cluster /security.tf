# Security Group for EKS Cluster
resource "aws_security_group" "eks_cluster" {
  name        = "eks-cluster-sg"
  description = "Allow communication for EKS Cluster"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows inbound traffic from anywhere 
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows all outbound traffic
  }

  tags = {
    Name = "eks-cluster-sg"
  }
}
