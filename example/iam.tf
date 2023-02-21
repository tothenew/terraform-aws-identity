module "iam" {
    source     = "git::https://github.com/tothenew/terraform-aws-identity.git"
    saml_provider_name="TestUser1"
}
