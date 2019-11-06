---
layout: page
---
## Overview

EnMasse is an open source project for managed, self-service messaging on [Kubernetes](https://kubernetes.io), and provides a uniform interface to manage different underlying messaging technologies. EnMasse can run on your own infrastructure or in the cloud, and simplifies running a messaging infrastructure for your organization.

The <b>service admin</b> can deploy and manage messaging infrastructure, while <b>tenants</b> can request messaging resources, both using <b>cloud-native</b> APIs and tools.

### Features

* Built-in <b>authentication</b> and <b>authorization</b> of clients and identity management
* Runs on <b>Kubernetes</b>: deploy <b>on-premise</b> or in the <b>cloud</b>
* Different <b>messaging patterns</b> like request-response, pub-sub and events
* Decouple <b>operation</b> of infrastructure from configuration and use by <b>applications</b>
* Integration with <b>Eclipse Hono</b> to support multiple IoT protocols, device and tenant management

EnMasse can be used for many purposes, such as moving your messaging infrastructure to the cloud <b>without depending on a specific cloud provider</b>, building a scalable messaging backbone for <b>IoT</b>, or just as a <b>cloud-ready</b> version of a message broker.

## Downloads

EnMasse releases are available for download on our [GitHub](https://github.com/EnMasseProject/enmasse/releases) page. The release artifacts contain YAML files and Ansible playbooks for deployment on OpenShift and Kubernetes. Docker images used in the releases are published to [Docker Hub](https://hub.docker.com/r/enmasseproject/).

Latest release:
{% assign menu = site.menus.dllatest %}
{% include doc_menu.html %}

Older releases can be found in the [Downloads](/downloads) page.

## Documentation

Documentation can be found on the [Documentation](/documentation) page.

## Getting help

* [EnMasse mailing list](https://www.redhat.com/mailman/listinfo/enmasse)
* [Gitter](https://gitter.im/EnMasseProject/community)

## Contributing

If you've got some great ideas and use cases for EnMasse, we would love to hear them!

* Raise issues on [GitHub](https://github.com/EnMasseProject/enmasse/issues).
* Read the [Hacking guide](https://github.com/EnMasseProject/enmasse/blob/master/HACKING.md) for details on how to build EnMasse.
* Fix issues by opening Pull Requests

## License

EnMasse is licensed under the [Apache License, Version 2.0](/LICENSE)
