# terraform-aws-template

[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)

This is a template to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

This modules creates the following resources:
 - Identity and Access Management (IAM) roles and policies
 - Identity roles created:
    - Admin Access
      - Policy attached: "arn:aws:iam::aws:policy/AdministratorAccess"
    - Data Scientist
      - Policy attached: "arn:aws:iam::aws:policy/job-function/DataScientist"
    - Database Admin
      - Policy attached: "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
    - Network Admin
      - Policy attached: ""arn:aws:iam::aws:policy/job-function/NetworkAdministrator"
    - Power User Access
      - Policy attached: "arn:aws:iam::aws:policy/PowerUserAccess"
    - Security Audit
      - Policy attached: "arn:aws:iam::aws:policy/SecurityAudit"
    - Support User
      - Policy attached: "arn:aws:iam::aws:policy/job-function/SupportUser""
    - System Admin
      - Policy attached: "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
    - View Only Access
      - Policy attached: "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"

  In addition you have the option to:

   - Set or not a IAM account alias
   - Set Maximum CLI/API session duration
      - The default value is 43200

## Usage
```
module "iam" {
    source     = "../"
    saml_provider_name="TestUser1"

}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |


## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_name | Account name (slug) | `any` | n/a | yes |
| create\_default\_roles | Create default roles in the account | `bool` | `true` | no |
| enable\_iam\_password\_policy | Enable IAM passoword policy | `bool` | `false` | no |
| iam\_password\_policy\_max\_password\_age | n/a | `number` | `90` | no |
| iam\_password\_policy\_password\_reuse\_prevention | n/a | `number` | `12` | no |
| role\_max\_session\_duration | Maximum CLI/API session duration | `string` | `"43200"` | no |
| saml\_provider\_arn | SAML Provider ARN to trust the roles created (pass either a name or ARN) | `string` | `""` | no |
| saml\_provider\_name | SAML Provider name to trust the roles created (pass either name or ARN) | `string` | `""` | no |


## Outputs

No outputs.

| Name | Description |
|------|-------------|
| iam\_role\_admin\_arn | AdministratorAccess IAM role ARN |
| iam\_role\_billing\_arn | BillingAccess IAM role ARN |
| iam\_role\_data\_scientist\_arn | DataScientist IAM role ARN |
| iam\_role\_database\_admin\_arn | DatabaseAdministrator IAM role ARN |
| iam\_role\_network\_admin\_arn | NetworkAdministrator IAM role ARN |
| iam\_role\_power\_user\_arn | PowerUserAccess IAM role ARN |
| iam\_role\_security\_audit\_arn | SecurityAudit IAM role ARN |
| iam\_role\_support\_user\_arn | SupportUser IAM role ARN |
| iam\_role\_system\_admin\_arn | SystemAdministrator IAM role ARN |
| iam\_role\_view\_only\_arn | ViewOnlyAccess IAM role ARN |

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.