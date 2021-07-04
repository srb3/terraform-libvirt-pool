output "name" {
  value = var.name
}

output "id" {
  value = libvirt_pool.this_pool.id
}
