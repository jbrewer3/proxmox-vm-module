output "vm_configurations" {
  value = { for vm_name, config in var.vm_configurations : vm_name => config }
}
