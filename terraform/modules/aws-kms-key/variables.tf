variable "description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = ""
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Specifies whether the key is enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "policy" {
  description = "A valid policy JSON document."
  type        = string
  default     = null
}

variable "alias" {
  description = "The display name of the alias. The name must start with the word 'alias' followed by a forward slash (alias/)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the object."
  type        = map(string)
  default     = {}
}