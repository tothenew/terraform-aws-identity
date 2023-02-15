resource "aws_iam_role" "admin" {
  count                = var.create_iam_admin_role ? 1 : 0
  name                 = "${var.project_name_prefix}-admin-access-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_saml.json
  max_session_duration = var.role_max_session_duration
  tags = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-admin-access-role" }))

}

resource "aws_iam_role_policy_attachment" "admin" {
  count      = var.create_iam_admin_role ? 1 : 0
  role       = aws_iam_role.admin[0].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

