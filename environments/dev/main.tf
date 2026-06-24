module "network" {

  source = "../../modules/network"

  vpc_name = "dev-vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnet = "10.0.1.0/24"

  subnet_name= "dev-subnet"

  igw_name= "dev-igw"
}

module "security_groups" {

  source = "../../modules/security_groups"

  vpc_id = module.network.vpc_id
  sg_id = "example"

}

module "ec2" {

  source = "../../modules/ec2"

  subnet_id = module.network.subnet_id

  sg_id = module.security_groups.sg_id

  instance_type = "t3.micro"

  instance_name = "dev-server"

}

module "s3" {

  source = "../../modules/s3"

  bucket_name = "company-dev-storage"

  env="dev"

}

module "iam" {

    source = "../../modules/iam"
}

