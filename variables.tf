variable "clone_template" {
  description = "clone template"
  type = string
  default = "Ubuntu-template-20220415-1103"
}
variable "cpu" {
  description = "cpu core"
  type        = number
  default = 2
}

variable "memory" {
  description = "memory size"
  type        = number
  default = 2048
}

variable "boot_disk_size" {
  description = "disk size"
  type        = string
  default = "20G"
}
variable "disk_size" {
  description = "disk size"
  type        = string
  default = "20G"
}

variable "disk_type" {
  type    = string
  default = "scsi" 
}

variable "disk_storage" {
  type    = string
  default = "local-lvm" 
}

variable "vm_count" {
  default = "1"
}

variable "vm_name" {
  default = "test"
}
variable "vmid_begin" {
  default = "270"
}

