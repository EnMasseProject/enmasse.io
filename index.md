---
layout: page
---
# Overview

EnMasse is an open source messaging platform, with focus on scalability and performance. EnMasse can run on your own infrastructure or in the cloud, and simplifies the deployment of messaging infrastructure.

The EnMasse project that aims to create, as a community, an open source messaging platform that runs on [Kubernetes](https://kubernetes.io/) and [OpenShift](http://openshift.org/). EnMasse promotes open standards like [AMQP](http://amqp.org/) and [MQTT](http://mqtt.org/) etc. and aims to provide support for other protocols as well.

# Features

* Handles different <b>communication patterns</b> like request-response, pub-sub and events
* Provides an [address model](http://enmasse.io/documentation/master/tenant/#address_model) and an [API](http://enmasse.io/documentation/master/tenant/#configuring-using-restapi) for managing messaging infrastructure
* Supports <b>multitenancy</b> with multiple isolated address spaces
* Built on <b>Kubernetes/OpenShift</b>: deploy <b>on-premise</b> or in the <b>cloud</b>

EnMasse supports a `standard` and a `brokered` address space types, each with different semantics. EnMasse can be used for many purposes, such as moving your messaging infrastructure to the cloud (without depending on a specific cloud provider) or building a scalable messaging backbone for IoT or just as a cloud-ready version of a message broker. 

#### Standard address space

The standard address space type is the default type in EnMasse, and is focused on scaling in the number of connections and the throughput of the system. It supports <b>AMQP</b> and <b>MQTT</b> protocols, with more to come in the future. This address space type is based on based on other open source projects like [Apache ActiveMQ Artemis](https://activemq.apache.org/artemis/) and [Apache Qpid Dispatch Router](https://qpid.apache.org/components/dispatch-router/index.html) and provides elastic scaling of these components.  From 40000 feet, the messaging infrastructure looks like this: 

![EnMasse Standard](https://raw.githubusercontent.com/EnMasseProject/enmasse/master/documentation/design_docs/overview/enmasse_overall_view.png)

#### Brokered address space

The brokered address space type is the "classical" message broker in the cloud. It supports JMS with transactions, message groups, selectors on queues etc. These kind of features are powerful in building complex messaging patterns. This address space is also the most light weight as it features only a single broker + a management console. The high level architecture of this address space looks like this:

![EnMasse Brokered](https://raw.githubusercontent.com/EnMasseProject/enmasse/master/documentation/design_docs/overview/enmasse_brokered_view.png)

To learn more about EnMasse, take a look at our [documentation](/documentation).
