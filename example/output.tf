output "proxmox_ip_address_default" {
  description = "Current IP Default"
  // value = "${var.default_ipv4_address}"
  value = "${module.proxmox.proxmox_ip_address_default}"
  //value = proxmox_vm_qemu.vm[*].default_ipv4_address
  //value = module.proxmox.proxmox_vm_qemu.vm[*].default_ipv4_address
}
