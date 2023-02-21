resource "aws_iam_role" "database_admin" {
  count                = var.create_iam_database_admin_role ? 1 : 0
  name                 = "${var.project_name_prefix}-database-admin-role"
  assume_role_policy   = data.aws_iam_policy_document.instance-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-database-admin-role" }))

}

resource "aws_iam_role_policy_attachment" "database_admin" {
  count      = var.create_iam_database_admin_role ? 1 : 0
  role       = aws_iam_role.database_admin[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
}

resource "aws_iam_instance_profile" "database_admin" {
  count = var.create_iam_database_admin_role ? 1 : 0
  name  = "${var.project_name_prefix}-database-admin-role"
  role  = aws_iam_role.database_admin[0].name
  tags  = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-database-admin-role" }))
}