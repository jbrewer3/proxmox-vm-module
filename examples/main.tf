module "proxmox_vms" {
  source = "git::https://github.com/jbrewer3/proxmox-vm-module.git?ref=v0.0.1"  # Path to your reusable VM module
  image_versions = var.image_versions
  current_user = var.current_user
  ssh_key_path = var.ssh_key_path
  pm_api_token = var.pm_api_token
  pm_api_url = var.pm_api_url
  pm_username = var.pm_username
  vm_configurations = var.vm_configurations
}
