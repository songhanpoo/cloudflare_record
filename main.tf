terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.25.1 and above) recommends Terraform 0.13.3 or above.
  # required_version = "= 0.13.3"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.21.0"
    }
  }
}

provider "cloudflare" {
  email = var.email
  api_key = var.api_key
}

data "cloudflare_zones" "this" {
  filter {
    name = var.listRecordSta
    status = "active"
  }
}

resource "cloudflare_record" "this" {
  count    = length(var.listRecordSta)
  zone_id  = "${data.cloudflare_zones.zone_id.zones[0].id}" # (Required)
  name     = var.obj[count.index].name # (Required)
  type     = var.obj[count.index].type # (Required)
  value    = var.obj[count.index].value # (Optional)
  ttl      = var.obj[count.index].ttl # (Optional)
  priority = var.obj[count.index].priority # (Optional)
  proxied  = var.obj[count.index].proxied # (Optional) default to false
}