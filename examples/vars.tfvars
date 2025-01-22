current_user       = "example_user"
pm_username        = "example_root"
pm_api_url         = "https://example-proxmox-server:8006/"                        # Replace with your Proxmox server hostname
pm_api_token       = "terraform@example!provider=example-token-id"                # Replace with your Proxmox API token ID
ssh_key_path       = "/home/example_user/.ssh/proxmox-terraform"

image_versions = {
  "image-v0.0.0" = {
    image_name = "os-v1.9.2.img"
    image_url  = "https://example.com/os-v1.9.2.img"
    version    = "v1.9.2"
  },
  "image-v0.0.1" = {
    image_name = "os-v1.9.0.img"
    image_url  = "https://example.com/os-v1.9.0.img"
    version    = "v1.9.0"
  }
}

vm_configurations = {
  "node-example-01" = {
    datastore_id   = "example-datastore"
    node_name      = "example-node"
    image_versions = "node-v1.9.2"
    cpu_cores      = 2
    memory_size_mb = 4096
    disk_size_gb   = 20
    network_bridge = "example-bridge"
    file_format    = "raw"
    disk_interface = "virtio0"
    os_type        = "l26"
    ipv4_address   = "10.0.0.100/24"
    gateway        = "10.0.0.1"
    tags           = ["example_tag_1", "example_tag_2"]
  },
  "node-example-other-01" = {
    datastore_id   = "example-datastore"
    node_name      = "example-node"
    image_versions = "node-v1.9.2"
    cpu_cores      = 4
    memory_size_mb = 4096
    disk_size_gb   = 20
    network_bridge = "example-bridge"
    file_format    = "raw"
    disk_interface = "virtio0"
    os_type        = "l26"
    ipv4_address   = "10.0.0.110/24"
    gateway        = "10.0.0.1"
    tags           = ["example_tag_1", "example_tag_3"]
  }
}
