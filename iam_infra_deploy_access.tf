data "aws_iam_policy_document" "infra-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.project_name_prefix}-terraform-tf-agent-role"]
    }
  }
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "infra_deploy_access" {
  count                = var.create_iam_infra_deploy_access_role ? 1 : 0
  name                 = "${var.project_name_prefix}-infra-deploy-access-role"
  assume_role_policy   = data.aws_iam_policy_document.infra-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-infra-deploy-access-role" }))

}

resource "aws_iam_role_policy_attachment" "infra_deploy_access" {
  count      = var.create_iam_infra_deploy_access_role ? 1 : 0
  role       = aws_iam_role.infra_deploy_access[0].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "infra_deploy_access" {
  count = var.create_iam_infra_deploy_access_role ? 1 : 0
  name  = "${var.project_name_prefix}-infra-deploy-access-role"
  role  = aws_iam_role.infra_deploy_access[0].name
  tags  = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-infra-deploy-access-role" }))
}


