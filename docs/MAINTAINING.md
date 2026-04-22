## Maintaining

The image is based on Fedora Kinoite and will automatically build at 10:05am UTC every day, which will also update the version of Fedora Kinoite automatically, ensuring all base system packages are up to date and it's on the latest version of Fedora Kinoite.

As per the `Containerfile`;

```bash
# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/kinoite-main:latest

## the following RUN directive does all the things required to run "build.sh" as recommended.
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
```

It will pull the latest fedora Kinoite image (`FROM ghcr.io/ublue-os/kinoite-main:latest`), mount and copy all files in `build_files` to the container image, then run the buildscript (`build_files/build.sh`) - Anything under `build_files` will be on the new system.

The `build.sh` script that is automatically called applies any modifications on top of Fedora Kinoite and works identically to as if you run commands on a running fedora system. Some commands, such as `dnf5`/`dnf` which cannot be run on the system can be used here to install additional packages on top of Kinoite to modify the base image.

If the container itself must be modifed, any changes can be added to `Containerfile` like normal - The distribution is very simply a container image with a kernel which can then be booted with `bootc`.  More details are available in the [Template Repository](https://github.com/ublue-os/image-template).
