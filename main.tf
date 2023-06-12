#creating VPC

module "vpc" {
  source                      = "./modules_vpc"
}

#creating eks

module "eks_cluster" {
  source                      = "./modules"                                                                                                 #"./eks-cluster"
  cluster_name                = "my-eks-cluster"
  region                      = "us-east-1"
  vpc_id                      = "vpc-0b2235733fdf581b4" # module.vpc.instance_vpc_id.id   #"vpc-0b2235733fdf581b4"
  subnet_ids                  = ["subnet-0d0cfac5dc1a381b2", "subnet-020080758f4beaf9d"]  #["module.vpc.my_vpc_public_subnet_001_id.id" , "module.vpc.my_vpc_public_subnet_002_id.id"]  # ["subnet-0d0cfac5dc1a381b2", "subnet-020080758f4beaf9d"]
  kubernetes_version          = "1.26"
  node_group_name             = "my-node-group"
  node_group_instance_type    = "t3.medium"
  node_group_desired_capacity = 1
  node_group_min_size         = 1
  node_group_max_size         = 2
}
