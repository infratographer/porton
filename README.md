# Portón (Gate in spanish)

Portón is an opinionated API Gateway based on [krakend](https://www.krakend.io/)
which includes a set of plugins to integrate with the Infratographer services.
The plugins are to be added in the near future.

Currently, this is based on krakend enterprise, so make sure you have a license file
before running this.

# Defaults

Portón comes with Krakend's flexible configuration enabled by default
[[1](https://www.krakend.io/docs/enterprise/configuration/flexible-config/)].

Plugins are built and copied into the resulting container image. The directory
containing the plugins is `/opt/krakend/plugins`.

The base krakend configuration and directories for the flexible configuration are not included
in the image. They are expected to be mounted into the container at runtime or
built into an extended all-in-one image.

# References

- [1] https://www.krakend.io/docs/enterprise/configuration/flexible-config/