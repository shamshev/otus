output "ip_addresses" {
  value = values(yandex_compute_instance.demo)[*].network_interface.0.nat_ip_address
}
