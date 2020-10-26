provider "yandex" {
  service_account_key_file = "../key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "demo" {
  for_each = toset(var.instances)
  name     = each.key

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

locals {
  //we can find structure and information in state file
  names = values(yandex_compute_instance.demo)[*].name
  ips   = values(yandex_compute_instance.demo)[*].network_interface.0.nat_ip_address
}

resource "local_file" "generate_inventory" {
  content = templatefile("hosts.tmpl", { 
    names = local.names,
    addrs = local.ips,
  })
  filename = "./hosts"

  provisioner "local-exec" {
    command = "chmod a-x ./hosts"
  }

  provisioner "local-exec" {
    when = destroy
    command = "mv ./hosts ./hosts.backup"
    on_failure = continue
  }
}

resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "echo '===== run ansible-playbook here ====='"
  }

  triggers = {
    addrs = join(",", local.ips),
  }

  depends_on = [local_file.generate_inventory]
}

