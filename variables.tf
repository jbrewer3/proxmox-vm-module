variable "vm_configurations" {
  description = "Map of VM configurations. Each key is a unique VM name."
  type = map(object({
    datastore_id   = string
    node_name      = string
    cpu_cores      = number
    memory_size_mb = number
    disk_size_gb   = number
    network_bridge = string
    file_format    = string
    disk_interface = string
    os_type        = string
    ipv4_address   = optional(string)
    gateway        = optional(string)
    image_versions = string
    tags           = optional(list(string))
  }))
}

variable "image_versions" {
  description = "A map of image versions and URLs for different nodes."
  type = map(object({
    image_name  = string
    image_url   = string
    version     = string
  }))
  default = {}
}

variable "pm_api_url" {
  description = "The Proxmox API endpoint"
  type        = string
}

variable "pm_api_token" {
  description = "The API token for Proxmox authentication"
  type        = string
  sensitive   = true
}

variable "pm_username" {
  description = "The SSH username for Proxmox node access"
  type        = string
}

variable "current_user" {
  description = "The local system user running Terraform"
  type        = string
}

variable "ssh_key_path" {
  description = "Path to the SSH private key for Terraform Proxmox access"
  type        = string
}
