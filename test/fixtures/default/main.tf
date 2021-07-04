provider "libvirt" {
  uri = "qemu:///system"
}

module "libvirt_pool" {
  source = "../../../examples/default/"
  name   = "test"
  type   = "dir"
  path   = "/var/lib/libvirt/images/test"
}
