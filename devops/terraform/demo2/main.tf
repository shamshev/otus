provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "demo-2" {
  name = "terraform"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
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
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}