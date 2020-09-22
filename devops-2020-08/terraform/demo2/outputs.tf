output "internal_ip_address_demo_2" {
  value = yandex_compute_instance.demo-2.network_interface.0.ip_address
}

output "external_ip_address_demo_2" {
  value = yandex_compute_instance.demo-2.network_interface.0.nat_ip_address
}