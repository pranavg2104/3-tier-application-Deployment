resource "aws_eks_node_group" "node_group" {
  cluster_name = aws_eks_cluster.cloud-application.name
  node_group_name = "three-tier-application-node-group"

  instance_types = ["t2.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  subnet_ids = data.aws_subnets.default.ids

  node_role_arn = aws_iam_role.node.arn

  depends_on = [
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-AmazonEC2ContainerRegistryReadOnly
  ]
}