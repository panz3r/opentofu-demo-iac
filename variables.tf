variable "passphrase" {
  description = "Passphrase used to encrypt OpenTofu state. Must be at least 16 characters long"
  type        = string
  sensitive   = true
  default     = "changeme!"

  validation {
    condition     = length(var.passphrase) >= 16
    error_message = "The passphare value must be at least 16 characters long."
  }
}

variable "github_token" {
  description = "GitHub API Token"
  type        = string
  sensitive   = true
}
