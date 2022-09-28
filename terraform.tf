provider "proxmox" {
  pm_parallel = 20
  pm_tls_insecure = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.10"
    }
  }
}
