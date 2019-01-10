resource "aws_iam_user_group_membership" "ex1" {
  user = "deployer"

  groups = [
    "superadmin",
  ]
}