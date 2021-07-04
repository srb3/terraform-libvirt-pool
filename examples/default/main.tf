provider "libvirt" {
  uri = "qemu:///system"
}

locals {
  name = "test"
  type = "dir"
  path = "/var/lib/libvirt/images/test"
  test_outputs = {
    "expected_name" = local.name
    "expected_type" = local.type
    "expected_path" = local.path
  }
}

module "libvirt_domain" {
  source = "../../"
  name   = local.name
  type   = local.type
  path   = local.path
}

# This file is only used by the testing scripts
# It acts as config and is not executable
resource "local_file" "attrs_create" {
  content         = yamlencode(local.test_outputs)
  filename        = "${path.root}/../../test/integration/attributes/default/attrs.yml"
  file_permission = "0644"
}
