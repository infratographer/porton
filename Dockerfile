# Specifies the builder image to use for building krakend plugins
ARG BUILDER_IMAGE=devopsfaith/krakend-plugin-builder

# Specifies the krakend gateway image
ARG IMAGE=devopsfaith/krakend

# Specifies the krakend image tag to use. The tag for the builder and the
# krakend images should match,a and so, this is handled via a single
# variable.
# renovate: depName=devopsfaith/krakend
ARG IMAGE_TAG=2.1.3


FROM $BUILDER_IMAGE:$IMAGE_TAG AS pluginbuilder

WORKDIR /go/src/porton

RUN mkdir -p /go/src/porton/lib

# Run the plugin builder
# ...

FROM $IMAGE:$IMAGE_TAG

# TODO: Run krakend as a non-root user

# For more information see https://www.krakend.io/docs/enterprise/configuration/flexible-config/
ENV FC_ENABLE=1
ENV FC_SETTINGS="/etc/krakend/settings"
ENV FC_PARTIALS="/etc/krakend/partials"
ENV FC_TEMPLATES="/etc/krakend/templates" 

# Note that these are expected to be volumes when running
# via an orchestration engine
RUN mkdir -p /etc/krakend/settings
RUN mkdir -p /etc/krakend/partials
RUN mkdir -p /etc/krakend/templates
RUN mkdir -p /usr/lib/krakend/plugins 

# Copy plugins from the pluginbuilder
COPY --from=pluginbuilder /go/src/porton/lib /usr/lib/krakend/plugins
