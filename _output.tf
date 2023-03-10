output "iam_role_admin_arn" {
  value       = aws_iam_role.admin[0].arn
  description = "AdministratorAccess IAM role ARN"
}
output "iam_instance_profile_admin_arn" {
  value       = aws_iam_instance_profile.admin[0].arn
  description = "AdministratorAccess instance profile ARN"
}
output "iam_instance_profile_admin_name" {
  value       = aws_iam_instance_profile.admin[0].name
  description = "AdministratorAccess instance profile NAME"
}

output "iam_role_infra_deploy_access_arn" {
  value       = aws_iam_role.infra_deploy_access[0].arn
  description = "AdministratorAccess IAM role ARN"
}
output "iam_instance_profile_infra_deploy_access_arn" {
  value       = aws_iam_instance_profile.infra_deploy_access[0].arn
  description = "AdministratorAccess instance profile ARN"
}
output "iam_instance_profile_infra_deploy_access_name" {
  value       = aws_iam_instance_profile.infra_deploy_access[0].name
  description = "AdministratorAccess instance profile NAME"
}

output "iam_role_terraform_tf_agent_arn" {
  value       = aws_iam_role.terraform_tf_agent[0].arn
  description = ""
}
output "iam_instance_profile_terraform_tf_agent_arn" {
  value       = aws_iam_instance_profile.terraform_tf_agent[0].arn
  description = ""
}
output "iam_instance_profile_terraform_tf_agent_name" {
  value       = aws_iam_instance_profile.terraform_tf_agent[0].name
  description = ""
}

output "iam_role_billing_arn" {
  value       = aws_iam_role.billing[0].arn
  description = "BillingAccess IAM role ARN"
}
output "iam_instance_profile_billing_arn" {
  value       = aws_iam_instance_profile.billing[0].arn
  description = "BillingAccess instance profile ARN"
}
output "iam_instance_profile_billing_name" {
  value       = aws_iam_instance_profile.billing[0].name
  description = "BillingAccess instance profile NAME"
}

output "iam_role_data_scientist_arn" {
  value       = aws_iam_role.data_scientist[0].arn
  description = "DataScientist IAM role ARN"
}
output "iam_instance_profile_data_scientist_arn" {
  value       = aws_iam_instance_profile.data_scientist[0].arn
  description = "DataScientist IAM instance profile ARN"
}
output "iam_instance_profile_data_scientist_name" {
  value       = aws_iam_instance_profile.data_scientist[0].name
  description = "DataScientist IAM instance profile NAME"
}

output "iam_role_database_admin_arn" {
  value       = aws_iam_role.database_admin[0].arn
  description = "DatabaseAdministrator IAM role ARN"
}
output "iam_instance_profile_database_admin_arn" {
  value       = aws_iam_instance_profile.database_admin[0].arn
  description = "AdministratorAccess instance profile ARN"
}
output "iam_instance_profile_database_admin_name" {
  value       = aws_iam_instance_profile.database_admin[0].name
  description = "AdministratorAccess instance profile NAME"
}

output "iam_role_network_admin_arn" {
  value       = aws_iam_role.network_admin[0].arn
  description = "NetworkAdministrator IAM role ARN"
}
output "iam_instance_profile_network_admin_arn" {
  value       = aws_iam_instance_profile.network_admin[0].arn
  description = "NetworkAdministrator instance profile ARN"
}
output "iam_instance_profile_network_admin_name" {
  value       = aws_iam_instance_profile.network_admin[0].name
  description = "NetworkAdministrator instance profile NAME"
}

output "iam_role_power_user_arn" {
  value       = aws_iam_role.power_user[0].arn
  description = "PowerUserAccess IAM role ARN"
}
output "iam_instance_profile_power_user_arn" {
  value       = aws_iam_instance_profile.power_user[0].arn
  description = "PowerUserAccess instance profile ARN"
}
output "iam_instance_profile_power_user_name" {
  value       = aws_iam_instance_profile.power_user[0].name
  description = "PowerUserAccess instance profile NAME"
}

output "iam_role_security_audit_arn" {
  value       = aws_iam_role.security_audit[0].arn
  description = "SecurityAudit IAM role ARN"
}
output "iam_instance_profile_security_audit_arn" {
  value       = aws_iam_instance_profile.security_audit[0].arn
  description = "SecurityAudit instance profile ARN"
}
output "iam_instance_profile_security_audit_name" {
  value       = aws_iam_instance_profile.security_audit[0].name
  description = "SecurityAudit instance profile NAME"
}


output "iam_role_support_user_arn" {
  value       = aws_iam_role.support_user[0].arn
  description = "SupportUser IAM role ARN"
}
output "iam_instance_profile_support_user_arn" {
  value       = aws_iam_instance_profile.support_user[0].arn
  description = "SupportUser instance profile ARN"
}
output "iam_instance_profile_support_user_name" {
  value       = aws_iam_instance_profile.support_user[0].name
  description = "SupportUser instance profile NAME"
}

output "iam_role_system_admin_arn" {
  value       = aws_iam_role.system_admin[0].arn
  description = "SystemAdministrator IAM role ARN"
}
output "iam_instance_profile_system_admin_arn" {
  value       = aws_iam_instance_profile.system_admin[0].arn
  description = "SystemAdministrator instance profile ARN"
}
output "iam_instance_profile_system_admin_name" {
  value       = aws_iam_instance_profile.system_admin[0].name
  description = "SystemAdministrator instance profile NAME"
}


output "iam_role_view_only_arn" {
  value       = aws_iam_role.view_only[0].arn
  description = "ViewOnlyAccess IAM role ARN"
}
output "iam_instance_profile_view_only_arn" {
  value       = aws_iam_instance_profile.view_only[0].arn
  description = "ViewOnlyAccess instance profile ARN"
}
output "iam_instance_profile_view_only_name" {
  value       = aws_iam_instance_profile.view_only[0].name
  description = "ViewOnlyAccess instance profile NAME"
}


output "iam_role_extra_arns" {
  value = aws_iam_role.extra.*.arn
}
output "iam_instance_profile_extra_arns" {
  value = aws_iam_instance_profile.extra.*.arn
}
output "iam_instance_profile_extra_name" {
  value = aws_iam_instance_profile.extra.*.name
}
