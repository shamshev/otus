variable token {
  description = "token"
}

variable cloud_id {
  description = "cloud"
}

variable folder_id {
  description = "folder"
}

variable zone {
  description = "zone"
  default     = "ru-central1-a"
}

variable subnet_id {
  description = "subnet for instance"
}

variable public_key_path {
  description = "path to the puplic ssh key"
  default     = "/root/.ssh/id_rsa.pub"
}