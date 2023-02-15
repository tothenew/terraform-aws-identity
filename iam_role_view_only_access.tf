resource "aws_iam_role" "view_only" {
  count                = var.create_iam_view_only_role ? 1 : 0
  name                 = "${var.project_name_prefix}-view-only-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_saml.json
  max_session_duration = var.role_max_session_duration
  tags = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-view-only-role" }))

}

resource "aws_iam_role_policy_attachment" "view_only" {
  count      = var.create_iam_view_only_role ? 1 : 0
  role       = aws_iam_role.view_only[0].name
  policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}