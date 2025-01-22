terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.69.1" 
    }
  }
}

provider "proxmox" {
  endpoint  = var.pm_api_url
  api_token = var.pm_api_token
  insecure  = true

  ssh {
    agent       = true
    username    = var.pm_username
    private_key = file("${var.ssh_key_path}")
  }
}
