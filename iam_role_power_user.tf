resource "aws_iam_role" "power_user" {
  count                = var.create_iam_power_user_role ? 1 : 0
  name                 = "${var.project_name_prefix}-power-user-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_saml.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-power-user-role" }))

}

resource "aws_iam_role_policy_attachment" "power_user" {
  count      = var.create_iam_power_user_role ? 1 : 0
  role       = aws_iam_role.power_user[0].name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_instance_profile" "power_user" {
  count                = var.create_iam_power_user_role ? 1 : 0
  name                 = "${var.project_name_prefix}-power-user-role"
  role       = aws_iam_role.power_user[0].name
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-power-user-role" }))
}