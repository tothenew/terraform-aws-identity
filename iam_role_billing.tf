resource "aws_iam_role" "billing" {
  count                = var.create_iam_billing_role ? 1 : 0
  name                 = "${var.project_name_prefix}-billing-role"
  assume_role_policy   = data.aws_iam_policy_document.instance-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-billing-role" }))

}

resource "aws_iam_role_policy_attachment" "billing" {
  count      = var.create_iam_billing_role ? 1 : 0
  role       = aws_iam_role.billing[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_instance_profile" "billing" {
  count = var.create_iam_billing_role ? 1 : 0
  name  = "${var.project_name_prefix}-billing-role"
  role  = aws_iam_role.billing[0].name
  tags  = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-billing-role" }))
}