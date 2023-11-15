variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
}

variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "vms_resources" {
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "common_metadata" {
  type        = map
  default     = {
    serial-port-enable = "1"
    ssh-keys          = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHhUMX5poGy6JJ6HfJZ2ed5ufuix9sUORs9igSuVrsTe root@server1"
  }
}