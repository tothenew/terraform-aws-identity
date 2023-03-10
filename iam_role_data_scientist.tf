resource "aws_iam_role" "data_scientist" {
  count                = var.create_iam_data_scientist_role ? 1 : 0
  name                 = "${var.project_name_prefix}-data-scientist-role"
  assume_role_policy   = data.aws_iam_policy_document.instance-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-data-scientist-role" }))

}

resource "aws_iam_role_policy_attachment" "data_scientist" {
  count      = var.create_iam_data_scientist_role ? 1 : 0
  role       = aws_iam_role.data_scientist[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/DataScientist"
}

resource "aws_iam_instance_profile" "data_scientist" {
  count = var.create_iam_data_scientist_role ? 1 : 0
  name  = "${var.project_name_prefix}-data-scientist-role"
  role  = aws_iam_role.data_scientist[0].name
  tags  = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-data-scientist-role" }))
}