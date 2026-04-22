## Deploying The Image

### Installing

The distribution can be installed like normal with an ISO file; but one must be built first (See BUILDING).

### Switching From other ostree Distributions

Alongside installing the distro directly with an ISO file, you can switch from any OSTREE based distribution trivially.

```bash
bootc switch ghcr.io/azerxalxd/lab.ccn.testing:latest
```

You can find the latest builds under [Github Packages](https://github.com/azerxalxd/lab.ccn.testing/pkgs/container/lab.ccn.testing/versions) and replace the tag with the hash of a specific build if necessary - However this means you will have to switch every time there's a new build rather than updating.

After a reboot, it will switch to the new image, or you can add `--apply` to automatically reboot afterwards:

```bash
bootc switch ghcr.io/azerxalxd/lab.ccn.testing:latest --apply
```

### Maintaining

If using the `latest` tag, you can simply run:

```bash
bootc upgrade
```

The update won't apply until the computer has restarted, to do this automatically:

```bash
bootc upgrade --apply
```

If an update fails or a build is broken, the previous version should be visible in GRUB which can be selected at boot.

