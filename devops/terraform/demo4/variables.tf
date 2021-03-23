variable token {
  description = "token"
}

variable cloud_id {
  description = "cloud"
}

variable folder_id {
  description = "folder"
}

variable subnet_id {
  description = "subnet for instance"
}

variable instances {
  type = list(string)
  default = ["app-01", "app-02", "db-01"]
}