output "isZoneActive" {
  value = data.cloudflare_zones.this.zones[0].name == var.domain ? "This zone active ${var.domain}" : "This zone inactive ${var.domain}"
}