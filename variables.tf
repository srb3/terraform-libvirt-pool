variable "name" {
  description = "The name of the network to create"
  type        = string
}

variable "type" {
  description = "The type of pool to create, currently only dir is sported"
  type        = string
  default     = "dir"
}

variable "path" {
  description = "The directory where the pool will keep it's volumes, only relevent for the dir pool type"
  type        = string
}
