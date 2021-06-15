variable "listRecordSta" {
  type = list(object({
    name     = string
    type     = string
    value    = string
    ttl      = number
    priority = number
    proxied  = bool
  }))

  description = "(Required) A object of array for record dns apply to cloudflare."
}

variable "domain" {
  type = string
  description = "(Required) This is variable for lookup domain, that get value zoneid then config dns record."
  validation {
    condition     = can(regex("^(([a-zA-Z]{1})|([a-zA-Z]{1}[a-zA-Z]{1})|([a-zA-Z]{1}[0-9]{1})|([0-9]{1}[a-zA-Z]{1})|([a-zA-Z0-9][a-zA-Z0-9-_]{1,61}[a-zA-Z0-9])).([a-zA-Z]{2,6}|[a-zA-Z0-9-]{2,30}.[a-zA-Z]{2,3})$", var.domain))
    error_message = "The domain value must only support one-sub level for domain. Ex: sub.example.com ,..."
  }
}