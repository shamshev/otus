//i didn't find another way how to get image id
data "yandex_compute_image" "my_image" {
  family = "ubuntu-1804-lts"
}