resource "aws_iam_role" "security_audit" {
  count                = var.create_iam_security_audit_role ? 1 : 0
  name                 = "${var.project_name_prefix}-security-audit-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_saml.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-security-audit-role" }))

}

resource "aws_iam_role_policy_attachment" "security_audit" {
  count      = var.create_iam_security_audit_role ? 1 : 0
  role       = aws_iam_role.security_audit[0].name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_iam_instance_profile" "security_audit" {
  count                = var.create_iam_security_audit_role ? 1 : 0
  name                 = "${var.project_name_prefix}-security-audit-role"
  role       = aws_iam_role.security_audit[0].name
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-security-audit-role" }))
}