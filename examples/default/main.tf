provider "libvirt" {
  uri = "qemu:///system"
}

locals {
  name = "test"
  type = "dir"
  path = "/var/lib/libvirt/images/test"
}

module "libvirt_pool" {
  source = "../../"
  name   = local.name
  type   = local.type
  path   = local.path
}

########### Testing data #########################

# The local variables and the module below are
# used to generate test data for this example.
# They are not needed for the core libvirt
# functionality
locals {
  attributes = {
    expected_name = local.name
    expected_type = local.type
    expected_path = local.path
  }
}

module "attributes" {
  source     = "../test_attributes"
  data       = yamlencode(local.attributes)
  test_suite = "default"
}
