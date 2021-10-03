# terraform-libvirt-pool

A terraform module for provisioning libvirt storage pools

## Usage

The following will create a libvirt storage pool called test.
It will set the storage pool type to dir, and set the path of the pool
to `/var/lib/libvirt/images/test`

```HCL
locals {
  name = "test"
  type = "dir"
  path = "/var/lib/libvirt/images/test"
}

module "libvirt_pool" {
  source = "srb3/pool/libvirt"
  name   = local.name
  type   = local.type
  path   = local.path
}
```

## Testing

This module uses [cinc-auditor](https://cinc.sh/start/auditor/) as a test framework.
To install you can use the [download page](https://cinc.sh/download/) and the
[getting started guid](https://cinc.sh/start/auditor/). The auditor test are
located in the [test --> integration directory](./test/integration).
There is a [make file](./Makefile)
in the root of the repo that takes care of orchestrating the tests
