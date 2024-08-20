resource "aws_eks_fargate_profile" "staging" {
  cluster_name         = aws_eks_cluster.cluster.name
  fargate_profile_name = "staging"
  pod_execution_role_arn = aws_iam_role.fargate_execution.arn
  subnet_ids           = [
    aws_subnet.private-us-west-1b.id,
    aws_subnet.private-us-west-1c.id
  ]

  selector {
    namespace = "staging"
  }
}
