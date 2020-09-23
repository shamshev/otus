provider "yandex" {
  service_account_key_file = "../key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "demo-foreach" {
  for_each = var.instances_dict
  name     = "terraform-${each.key}-${each.value}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd83bj827tp2slnpp7f0"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  
  scheduling_policy {
    preemptible = true
  }
  
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  depends_on = [
    yandex_kms_symmetric_key.key-example
  ]
}

resource "yandex_kms_symmetric_key" "key-example" {
  name              = "example-symetric-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
}

resource "yandex_compute_instance" "demo-count" {
  count = length(var.instances_list)
  name  = "terraform-${var.instances_list[count.index]}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd83bj827tp2slnpp7f0"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  
  scheduling_policy {
    preemptible = true
  }
  
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}