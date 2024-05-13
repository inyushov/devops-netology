variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "public_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "private_cidr" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "netology"
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsVjx0pXAwKtxbe47aUVXIMA2Ec9x+RAWBaKMGeCK6znf78yyJe/CSv/cApcVVmkxog3isTfMNSvSLPftw7x17/fSXOD/1iHSwXpPJro26FWZcP5iNHdzdB6L/LRzbD30QhLxkel++93zftjMSNmR/5Ou9P9Z9eH8aX625zVCma78pBARUW1EpYRq24v2EBrvmwdyB+CAlvQhBeLFqTkLapfw+amfCefMIyO2qMbFZ6a7pXICZPqSqfatVEIcn8N7UaGh/FuZUnlkw3v2Z8k9MYTPJTrojznGc7S8zksnk8KH4xu1N7ohaU1CRqqepSZk3xKuuwmdwmmqEfYRsw7qUb9I1qzqvK7RLkNNJD0wHT83nGZBRUj6j22dFwqgasYUxc6UyqsemJq//q5q12bR3/QgsSErRVF959fOczNwqki+Oyt+X7TIvtHVTm2lKYlArYssNq6QekS1m0MpBL/MXYUjJnBDqgE46eiCBU0pJDRAJQ6ojfAGoHkdGxhfVkH8= root@server1"
}

variable "yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.com/en/docs/cli/cli-ref/managed-services/compute/instance/"
}

variable "yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/image/"
}

variable "metadata_map" {
  type = map
  default     = {
    metadata = {
      serial-port-enable = 1
    }
  }
}