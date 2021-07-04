resource "libvirt_pool" "this_pool" {
  name = var.name
  type = var.type
  path = var.path
}
