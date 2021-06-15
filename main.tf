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

data "cloudflare_zones" "this" {
  filter {
    name = var.domain
    status = "active"
  }
}

resource "cloudflare_record" "this" {
  count    = length(var.listRecordSta)
  zone_id  = "${data.cloudflare_zones.this.zones[0].id}" # (Required)
  name     = var.listRecordSta[count.index].name # (Required)
  type     = var.listRecordSta[count.index].type # (Required)
  value    = var.listRecordSta[count.index].value # (Optional)
  ttl      = var.listRecordSta[count.index].ttl # (Optional)
  priority = var.listRecordSta[count.index].priority # (Optional)
  proxied  = var.listRecordSta[count.index].proxied # (Optional) default to false
}