resource "aws_eks_cluster" "cloud-application" {
  name = "three-tier-application-cluster"

  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    subnet_ids = data.aws_subnet_ids.default.ids
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy
  ]
}