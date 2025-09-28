data "aws_availability_zones" "available" {
  // Filters for Availability Zones that are currently 'available' in the configured AWS region.
  state = "available"
}
// This data source retrieves a list of all available Availability Zones (AZs) in the current AWS region.
// It allows for dynamic selection of AZs for resource creation (like subnets).


data "aws_iam_role" "instance_profile_role" {
  name = "test-role"
}