
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"
  # insert the 7 required variables here

  cluster_version = "1.22"
  cluster_name    = "weknowx"
  # get vpc_id, subnets from VPC module
  vpc_id     = module.EKS-weknowx-VPC.vpc_id
  subnet_ids = module.EKS-weknowx-VPC.private_subnets

  tags = {
    environment = "testing"
    application = "weknowx"
  }


  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    #blue = {}
    green = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.medium"]
    }
  }
}

output "eks-cluster-id" {
  value = module.eks.cluster_id
}
