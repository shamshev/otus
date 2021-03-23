provider "yandex" {
  token     = "change_me"
  cloud_id  = "change_me"
  folder_id = "change_me"
  zone      = "ru-central1-a"
}

data "yandex_compute_image" "my_image" {
  family = "ubuntu-1804-lts"
}

resource "yandex_compute_instance" "demo-1" {
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
    subnet_id = yandex_vpc_subnet.subnet-demo1.id
    nat       = true
  }
  
  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-demo1" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet-demo1" {
  name           = "subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-demo1.id
  v4_cidr_blocks = ["192.168.32.0/24"]
}