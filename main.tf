

/* Uses cloud-init options from Proxmox 5.2 */
resource "proxmox_vm_qemu" "vm" {

  count = "${var.vm_count}"
  name  = "${var.vm_name}${count.index + 1}"
  vmid   = "${count.index + var.vmid_begin}"

  desc        = "tf description"
  target_node = "pve21${count.index + 1}"

  clone = var.clone_template

  sockets = 1
  cores   = var.cpu
  memory  = var.memory

  #disk {
  #  size    = var.boot_disk_size
  #  type    = var.disk_type
  #  storage = var.disk_storage
  #  ssd = 1
  #}
  #disk {
  #  size    = var.disk_size
  #  type    = var.disk_type
  #  storage = var.disk_storage
  #  ssd = 1
  #}
  boot       = "c"
  bootdisk   = "scsi0"
  agent      = 1
  full_clone = "false"
  hotplug    = "disk,usb"

  ipconfig0  = "ip=dhcp"
  network {
    model  = "virtio"
    bridge = "vmbr3"
  }

  os_type = "cloud-init"

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.vm_name}${count.index + 1} && ip addr && mkdir -p ~/.ssh/ && curl -s http://yimeng.ch/key.sh | sh -"
    ]
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = self.ssh_host
    }
  }

  provisioner "local-exec" {
    command = "echo hello && echo 'abc' > /tmp/abc"
    #command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' apache-install.yml"
  }

}
