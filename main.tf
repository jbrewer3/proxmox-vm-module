resource "proxmox_virtual_environment_download_file" "iso_image" {
  for_each = var.image_versions

  content_type           = "iso"
  datastore_id           = "local"  # Datastore where you want to store the image
  node_name              = "pve"  # Proxmox node where the image is being downloaded
  file_name              = "${each.value.image_name}"  # The name of the image file
  url                    = each.value.image_url  # URL to the image
  overwrite              = false  # Don't overwrite the image unless explicitly needed
}


resource "proxmox_virtual_environment_vm" "this" {
  depends_on = [ proxmox_virtual_environment_download_file.iso_image ]
  for_each = var.vm_configurations

  name        = each.key
  description = "Managed by Terraform"
  tags        = each.value.tags
  node_name   = each.value.node_name
  on_boot     = true

  cpu {
    cores = each.value.cpu_cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = each.value.memory_size_mb
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = each.value.network_bridge
  }

  disk {
    datastore_id = each.value.datastore_id
    file_id      = proxmox_virtual_environment_download_file.iso_image[each.value.image_versions].id  # Refer to specific image version
    file_format  = each.value.file_format
    interface    = each.value.disk_interface
    size         = each.value.disk_size_gb
  }

  operating_system {
    type = each.value.os_type
  }

  initialization {
    datastore_id = each.value.datastore_id
    ip_config {
      ipv4 {
        address = each.value.ipv4_address
        gateway = each.value.gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}

