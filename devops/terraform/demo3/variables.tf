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

variable instances_list {
  #type = list(string)
  #default = ["srv01", "srv02"]
  default = 1
}

variable instances_dict {
  type = map(string)
  default = {
    instance1 = "app-server",
    instance2 = "db-server"
  }
}