# cloudflare_record

This module creates cloudflare record.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| [cloudflare/cloudflare](https://github.com/cloudflare/terraform-provider-cloudflare) | >= 2.21.0 |
| [terraform](#requirement\_aws) | >= 0.15.3 |

## Providers

| Name | Version |
|------|---------|
| [cloudflare/cloudflare](https://github.com/cloudflare/terraform-provider-cloudflare) | >= 2.49 |

## Modules

#NA

## Resources

| Name | Type |
|------|------|
| [cloudflare_zones.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones) | data_sources |
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [listRecordSta](#input\_listRecordSta) | A object of array for record dns apply to cloudflare. | `list(object()` | `NA` | yes |
| [domain](#input\_domain) | This is variable for lookup domain, that get value zoneid then config dns record. *The domain value must only support one-sub level for domain*. | `string` | `NA` | yes |
| [api_key](#input\_api_key) | This is api key for authen with cloudflare | `string` | `NA` | yes |
| [email](#input\_hostnames) | This is email for authentication with cloudflare. *The domain value must only support one-sub level for domain*.| `string` | `NA` | yes |

## Outputs
### Console output
| Name | Description |
|------|-------------|
| | Name of Cloudflare console |
| [cloudflare\_isZoneActive](#output\_isZoneActive) | Show status zone applied  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->