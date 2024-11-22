# terraform-aws-iam-role
# AWS IAM Role Terraform Configuration

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [Author](#author)
- [License](#license)

## Introduction

This Terraform configuration sets up an AWS Identity and Access Management (IAM) role with associated policies, specifically designed for EC2 instances. The role allows EC2 instances to assume it and has a policy granting permissions related to AWS Systems Manager (SSM).

## Usage

To get started, make sure you have configured your AWS provider. You can use the following code as a starting point:

```hcl

module "iam-role" {
  source             = "https://github.com/SyncArcs/terraform-aws-iam-role.git"
  version            = "1.0.0"
  name               = "iam"
  environment        = "test"
  assume_role_policy = data.aws_iam_policy_document.default.json
  policy_enabled     = true
  policy             = data.aws_iam_policy_document.iam-policy.json
}
```

## Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/SyncArcs/terraform-aws-iam-role/tree/master/_example) directory within this repository.

## Author
Your Name Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/SyncArcs/terraform-aws-iam-role/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lables"></a> [lables](#module\_lables) | git::https://github.com/SyncArcs/terraform-aws-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | Whether to create Iam role. | `any` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the role. | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to create Iam role. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | The policy that grants an entity permission to assume the role. | `bool` | `false` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | Set of exclusive IAM managed policy ARNs to attach to the IAM role | `list(any)` | `[]` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'SyncArcs' | `string` | `""` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to the role. | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `""` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The policy document. | `any` | `null` | no |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | The ARN of the policy you want to apply. | `string` | `""` | no |
| <a name="input_policy_enabled"></a> [policy\_enabled](#input\_policy\_enabled) | Whether to Attach Iam policy with role. | `bool` | `false` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) specifying the role. |
| <a name="output_name"></a> [name](#output\_name) | Name of the role. |
| <a name="output_policy"></a> [policy](#output\_policy) | The policy document attached to the role. |
| <a name="output_role"></a> [role](#output\_role) | The name of the role associated with the policy. |
| <a name="output_tags"></a> [tags](#output\_tags) | A mapping of tags to assign to the resource. |
<!-- END_TF_DOCS -->