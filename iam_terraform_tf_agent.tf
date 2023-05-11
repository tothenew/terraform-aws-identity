resource "aws_iam_role" "terraform_tf_agent" {
  count                = var.create_iam_terraform_tf_agent_role ? 1 : 0
  name                 = "${var.project_name_prefix}-terraform-tf-agent-role"
  assume_role_policy   = data.aws_iam_policy_document.instance-assume-role-policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-terraform-tf-agent-role" }))
}

resource "aws_iam_instance_profile" "terraform_tf_agent" {
  count = var.create_iam_terraform_tf_agent_role ? 1 : 0
  name  = "${var.project_name_prefix}-terraform-tf-agent-role"
  role  = aws_iam_role.terraform_tf_agent[0].name
  tags  = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-terraform-tf-agent-role" }))
}

resource "aws_iam_role_policy_attachment" "ssm" {
  count = var.create_iam_terraform_tf_agent_role ? 1 : 0
  role       = aws_iam_role.terraform_tf_agent[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "s3" {
  count = var.create_iam_terraform_tf_agent_role ? 1 : 0
  role       = aws_iam_role.terraform_tf_agent[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "dynamo_db" {
  count = var.create_iam_terraform_tf_agent_role ? 1 : 0
  role       = aws_iam_role.terraform_tf_agent[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
resource "aws_iam_policy" "additional_policy" {
  name        = "my-additional-iam-policy"
  description = "Additional IAM policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:*",
                "cloudfront:*",
                "rds:*",
                "ecr:*",
                "ec2:*",
                "eks:*",
                "elasticache:*",
                "waf:*",
                "kms:*",
                "wafv2:*"
                
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "additional_policy_attachment" {
  role       = "aws_iam_role.terraform_tf_agent[0].name"
  policy_arn = aws_iam_policy.additional_policy.arn
}

resource "aws_iam_role_policy_attachment" "vpc" {
  role       = "aws_iam_role.terraform_tf_agent[0].name"
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}
resource "aws_iam_role_policy_attachment" "ssmFull" {
  role       = "aws_iam_role.terraform_tf_agent[0].name"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}
resource "aws_iam_role_policy_attachment" "autoscaling" {
  role       = "aws_iam_role.terraform_tf_agent[0].name"
  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}
