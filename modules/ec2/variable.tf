variable "instances" {
  description = "List of instance configurations"
  type        = list(object({
    ami_id        = string
    instance_type = string
    name          = string
  }))
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}
