resource "aws_iam_role" "extra" {
  count = length(var.extra_roles)

  name                 = element(var.extra_roles, count.index)
  assume_role_policy   = data.aws_iam_policy_document.instance-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
}

resource "aws_iam_role_policy" "extra" {
  count      = length(keys(var.extra_roles_policy))
  depends_on = [aws_iam_role.extra]

  name   = "${element(keys(var.extra_roles_policy), count.index)}-access"
  role   = element(keys(var.extra_roles_policy), count.index)
  policy = element(values(var.extra_roles_policy), count.index)
}

resource "aws_iam_role_policy_attachment" "extra" {
  count      = length(keys(var.extra_roles_policy_arn))
  depends_on = [aws_iam_role.extra]

  role       = element(keys(var.extra_roles_policy_arn), count.index)
  policy_arn = element(values(var.extra_roles_policy_arn), count.index)
}

resource "aws_iam_instance_profile" "extra" {
  count = length(keys(var.extra_roles_policy_arn))
  name  = element(var.extra_roles, count.index)
  role  = element(keys(var.extra_roles_policy_arn), count.index)
}