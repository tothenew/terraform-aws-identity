# module "iam" {
#     source     = "git::https://github.com/tothenew/terraform-aws-identity.git"
#     saml_provider_name="TestUser1"
# }

module "iam" {
    source     = "../"
    saml_provider_name="TestUser1"
}


