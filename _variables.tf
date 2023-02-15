variable "project_name_prefix" {
  description = "A string value to describe prefix of all the resources"
  type        = string
  default     = "dev"
}

variable "create_iam_admin_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}


variable "create_iam_billing_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}


variable "create_iam_data_scientist_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "create_iam_database_admin_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "create_iam_network_admin_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "create_iam_power_user_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}


variable "create_iam_security_audit_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "create_iam_support_user_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "create_iam_system_admin_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "create_iam_view_only_role" {
  description = "A string value to describe prefix of all the resources"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default = {
    "Created By" = "terraform"
  }
}

variable "extra_roles" {
  default     = []
  description = "A list of extra roles to create in this account"
}

variable "extra_roles_policy_arn" {
  default     = {}
  description = "A map of { <role_name> = <policy arn> } to attach policies to extra roles in this account (role must be declared at extra_roles first)"
}

variable "extra_roles_policy" {
  default     = {}
  description = "A map of { <role_name> = <json policy> } to create policies to extra roles in this account (role must be declared at extra_roles first)"
}

variable "saml_provider_name" {
  description = "SAML Provider name to trust the roles created (pass either name or ARN)"
  default     = ""
}

variable "saml_provider_arn" {
  description = "SAML Provider ARN to trust the roles created (pass either a name or ARN)"
  default     = ""
}

variable "role_max_session_duration" {
  description = "Maximum CLI/API session duration"
  default     = "43200"
}

variable "enable_iam_password_policy" {
  description = "Enable IAM passoword policy"
  default     = false
}

variable "iam_password_policy_max_password_age" {
  default = 90
}

variable "iam_password_policy_password_reuse_prevention" {
  default = 12
}