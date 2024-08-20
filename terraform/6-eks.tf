resource "aws_iam_role" "eks-cluster" {
  name = "eks-cluster-${var.cluster_name}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role     = aws_iam_role.eks-cluster.name
}


resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  version = var.cluster_version
  role_arn  = aws_iam_role.eks-cluster.arn

  vpc_config {

    endpoint_private_access = false
    endpoint_public_access = true
    public_access_cidrs = ["0.0.0.0/0"]

    subnet_ids = [
        aws_subnet.private-us-west-1b.id,
        aws_subnet.private-us-west-1c.id,
        aws_subnet.public-us-west-1b.id,
        aws_subnet.public-us-west-1c.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}