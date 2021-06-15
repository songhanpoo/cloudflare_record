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
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^(([a-zA-Z]{1})|([a-zA-Z]{1}[a-zA-Z]{1})|([a-zA-Z]{1}[0-9]{1})|([0-9]{1}[a-zA-Z]{1})|([a-zA-Z0-9][a-zA-Z0-9-_]{1,61}[a-zA-Z0-9]))\.([a-zA-Z]{2,6}|[a-zA-Z0-9-]{2,30}\.[a-zA-Z]{2,3})$", var.domain))
    error_message = "The domain value must only support one-sub level for domain"
  }
}

variable "api_key" {
  type = string
  description = "(Required) This is api key for authen with cloudflare"
}

variable "email" {
  type = string
  description = "This is email for authen with cloudflare"
  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$", var.email))
    error_message = "The domain value must only support one-sub level for domain"
  }
}