resource "aws_iam_role" "support_user" {
  count                = var.create_iam_support_user_role ? 1 : 0
  name                 = "${var.project_name_prefix}-support-user-role"
  assume_role_policy   = data.aws_iam_policy_document.instance-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-support-user-role" }))

}

resource "aws_iam_role_policy_attachment" "support_user" {
  count      = var.create_iam_support_user_role ? 1 : 0
  role       = aws_iam_role.support_user[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_instance_profile" "support_user" {
  count = var.create_iam_support_user_role ? 1 : 0
  name  = "${var.project_name_prefix}-support-user-role"
  role  = aws_iam_role.support_user[0].name
  tags  = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-support-user-role" }))
}