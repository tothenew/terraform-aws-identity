resource "aws_iam_role" "system_admin" {
  count                = var.create_iam_system_admin_role ? 1 : 0
  name                 = "${var.project_name_prefix}-system-admin-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_saml.json
  max_session_duration = var.role_max_session_duration
  tags = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-system-admin-role" }))

}

resource "aws_iam_role_policy_attachment" "system_admin" {
  count      = var.create_iam_system_admin_role ? 1 : 0
  role       = aws_iam_role.system_admin[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
}