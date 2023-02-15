locals {
  saml_provider_arn = var.saml_provider_name != "" ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:saml-provider/${var.saml_provider_name}" : var.saml_provider_arn
}