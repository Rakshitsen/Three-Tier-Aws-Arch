#-------------------------------------------------------------------------
# Region Configuration
#-------------------------------------------------------------------------
region = "ap-south-1"

#-------------------------------------------------------------------------
# VPC Configuration
#-------------------------------------------------------------------------
vpc_cidr = "10.0.0.0/16"
vpc_name = "my-vpc"
igw_name = "my-igw"
nat_name = "my-nat"

#-------------------------------------------------------------------------
# Subnet Configuration
#-------------------------------------------------------------------------
public_subnet_name = "my-public"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnet_name = "my-private"
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

#-------------------------------------------------------------------------
# Route Table Configuration
#-------------------------------------------------------------------------
public_routeTable_name = "public-rt"
private_routeTable_name = "private-rt"

public_destination_cidr = "0.0.0.0/0"
private_destination_cidr = "0.0.0.0/0"

#-------------------------------------------------------------------------
# S3 Bucket Configuration
#-------------------------------------------------------------------------
bucket_name = "my-german-indian-bucket"
versioning = "Enabled"
index_html_file = "s3_aboutpage.html"
error_html_file = "s3_errorpage.html"

#-------------------------------------------------------------------------
# SNS Topic Configuration
#-------------------------------------------------------------------------
sns_topic_name = "my-sns-topic"
protocol = "email"
endpoint = "mitis71327@auslank.com"

#-------------------------------------------------------------------------
# Lambda Function Configuration
#-------------------------------------------------------------------------
function_name = "my-lambda-function"
runtime = "python3.9"
index_filename = "index.py"
function_folder_name = "lambda-function"

#-------------------------------------------------------------------------
# IAM role Configuration
#-------------------------------------------------------------------------
role_name = "my-lambda-role"

#-------------------------------------------------------------------------
# Dynamodb Configuration
#-------------------------------------------------------------------------
billing_mode = "PROVISIONED"
read_capacity = 20
write_capacity = 20
dynamodb_table_name = "image_metadata"
partition_key = "filename"
sort_key = "upload_time"

#-------------------------------------------------------------------------
# ALB Configuration
#-------------------------------------------------------------------------
alb_name = "my-alb"
load_balancer_type = "application"
is_internal = false

target_group_name = "my-target-group"
target_port = 5000
target_protocol = "HTTP"

#-------------------------------------------------------------------------
# Launch Template Configuration
#-------------------------------------------------------------------------
launch_template_name = "my-launch-template"
ami_id = "ami-01b6d88af12965bb6"
instance_type = "t3.micro"
volume_size = 20

#-------------------------------------------------------------------------
# ASG Configuration
#-------------------------------------------------------------------------
asg_name = "my-asg"
desired_capacity = 1
max_size = 2
min_size = 1

#-------------------------------------------------------------------------
# RDS Configuration
#-------------------------------------------------------------------------
allocated_storage = 20
db_name = "mydatabase"
username = "admin"
password = "Admin12345"
engine = "mysql"
engine_version = "8.0.42"
instance_class = "db.t3.micro"
parameter_group_name = "default.mysql8.0"
skip_final_snapshot = true
