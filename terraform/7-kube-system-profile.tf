
resource "aws_iam_role" "fargate_execution" {
  name = "fargate-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks-fargate-pods.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "fargate_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role     = aws_iam_role.fargate_execution.name
}

resource "aws_eks_fargate_profile" "profile2" {
  cluster_name         = aws_eks_cluster.cluster.name
  fargate_profile_name = "kube-system"
  pod_execution_role_arn = aws_iam_role.fargate_execution.arn
  subnet_ids           = [
    aws_subnet.private-us-west-1b.id,
    aws_subnet.private-us-west-1c.id
  ]

  selector {
    namespace = "kube-system"
  }
}
