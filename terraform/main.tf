module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  igw_name = var.igw_name
}

module "subnet" {
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  public_subnet_name  = var.public_subnet_name
  private_subnet_name = var.private_subnet_name
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  nat_name           = var.nat_name
}

module "route_table" {
  source                  = "./modules/route_table"
  vpc_id                  = module.vpc.vpc_id
  igw_id                  = module.vpc.igw_id
  nat_id                  = module.subnet.nat_id
  public_routeTable_name  = var.public_routeTable_name
  private_routeTable_name = var.private_routeTable_name
  public_destination_cidr  = var.public_destination_cidr
  private_destination_cidr = var.private_destination_cidr
  public_subnet_ids        = module.subnet.public_subnet_ids
  private_subnet_ids       = module.subnet.private_subnet_ids
}

module "alb_sg" {
  source                   = "./modules/security-groups"
  security_group_name       = "alb-sg"
  security_group_description = "ALB Security Group"
  vpc_id                    = module.vpc.vpc_id

  ingress_rules = [
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "web_sg" {
  source                   = "./modules/security-groups"
  security_group_name       = "web-sg"
  security_group_description = "Web Server Security Group"
  vpc_id                    = module.vpc.vpc_id

  ingress_rules = [
    {
      description     = "Allow from ALB"
      from_port       = 5000
      to_port         = 5000
      protocol        = "tcp"
      security_groups = [module.alb_sg.sg_id]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "rds_sg" {
  source                   = "./modules/security-groups"
  security_group_name       = "rds-sg"
  security_group_description = "RDS Security Group"
  vpc_id                    = module.vpc.vpc_id

  ingress_rules = [
    {
      description     = "Allow from Web Servers"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      security_groups = [module.web_sg.sg_id]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "S3" {
  source          = "./modules/s3"
  bucket_name     = var.bucket_name
  versioning      = var.versioning
  index_html_file = var.index_html_file
  error_html_file = var.error_html_file
  lambda_function_arn = module.lambda.lambda_arn
  lambda_function_name = module.lambda.function_name
}

module "sns" {
  source         = "./modules/sns"
  sns_topic_name = var.sns_topic_name
  protocol       = var.protocol
  endpoint       = var.endpoint
}

module "iam_role" {
  source    = "./modules/iam"
  role_name = var.role_name
}

module "lambda" {
  source              = "./modules/lambda"
  function_name       = var.function_name
  index_filename      = var.index_filename
  function_folder_name = var.function_folder_name
  runtime             = var.runtime
  IAM_role_arn        = module.iam_role.iam_role_arn
  SNS_TOPIC_ARN       = module.sns.topic_arn
}

module "dynamodb" {
  source              = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
  billing_mode        = var.billing_mode
  partition_key       = var.partition_key
  sort_key            = var.sort_key
  read_capacity       = var.read_capacity
  write_capacity      = var.write_capacity
}

module "alb" {
  source             = "./modules/alb"
  alb_name           = var.alb_name
  is_internal        = var.is_internal
  load_balancer_type = var.load_balancer_type
  alb_name_sg_id     = module.alb_sg.sg_id
  public_subnet_ids  = module.subnet.public_subnet_ids
  target_group_name  = var.target_group_name
  target_port        = var.target_port
  target_protocol    = var.target_protocol
  vpc_id             = module.vpc.vpc_id
}

module "launch_template" {
  source               = "./modules/launch-template"
  launch_template_name = var.launch_template_name
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  volume_size          = var.volume_size
  security_group_id    = module.web_sg.sg_id
  iam_instance_profile_name = data.aws_iam_role.instance_profile_role.name
}

module "asg" {
  source             = "./modules/asg"
  asg_name           = var.asg_name
  availability_zones = data.aws_availability_zones.available.names
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  launch_template_id  = module.launch_template.launch_template_id
  subnet_ids          = module.subnet.private_subnet_ids
  target_group_arns   = [module.alb.target_group_arn]
}

module "rds" {
  source               = "./modules/rds"
  db_name              = var.db_name
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  subnet_ids           = module.subnet.private_subnet_ids
  security_group_ids   = [module.rds_sg.sg_id]
}
