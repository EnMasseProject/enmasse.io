---
layout: page
---
## Documentation

<table bgcolor="#F5F5F5" cellspacing="5" style="padding-left: 20px; padding-top: 20px; padding-bottom: 30px; padding-right: 20px; width: 30%; display: inline-block;">
<thead>
<tr>
<th colspan="2" align="left" style="padding-bottom: 10px;">Kubernetes</th>
</tr>
</thead>
<tbody>
<tr>
<td width="75%">Latest release</td>
<td>
{% assign menu = site.menus.kubernetesdocslatest %}
{% include doc_menu.html %}
</td>
</tr>
<tr>
<td>Master</td>
<td>
{% assign menu = site.menus.kubernetesdocsmaster %}
{% include doc_menu.html %}
</td>
</tr>
<tr valign="top">
<td>Older releases</td>
<td>
{% assign menu = site.menus.kubernetesdocsolder %}
{% include doc_menu.html %}
</td>
</tr>
</tbody>
</table>

<table cellspacing="5" style="padding-left: 20px; padding-top: 20px; padding-bottom: 30px; padding-right: 20px; width: 40px; display: inline-block;" />

<table bgcolor="#F5F5F5" cellspacing="5" style="padding-left: 20px; padding-top: 20px; padding-bottom: 30px; padding-right: 20px; width: 30%; display: inline-block;">
<thead>
<tr>
<th colspan="2" align="left" style="padding-bottom: 10px;">OpenShift</th>
</tr>
</thead>
<tbody>
<tr>
<td width="75%">Latest release</td>
<td>
{% assign menu = site.menus.openshiftdocslatest %}
{% include doc_menu.html %}
</td>
</tr>
<tr>
<td>Master</td>
<td>
{% assign menu = site.menus.openshiftdocsmaster %}
{% include doc_menu.html %}
</td>
</tr>
<tr valign="top">
<td>Older releases</td>
<td>
{% assign menu = site.menus.openshiftdocsolder %}
{% include doc_menu.html %}
</td>
</tr>
</tbody>
</table>



<br />

## Articles

* [EnMasse and Gitops](http://lulf.no/technical/kubernetes/enmasse/gitops/openshift/2019/04/08/gitops-and-enmasse.html)
* [EnMasse and Gitops - Part 2 (Operations)](http://lulf.no/technical/kubernetes/enmasse/gitops/openshift/monitoring/prometheus/grafana/2019/05/06/gitops-and-enmasse-operations.html)

## Slides

* Open sourcing the IoT [slides](https://www.slideshare.net/paolopat/open-sourcing-the-iot-93787899) (CloudConf, April 2018)
* Open sourcing the messaging and IoT [video](https://www.youtube.com/watch?v=ZIp9EPQ25eM) and [slides](https://www.slideshare.net/paolopat/open-sourcing-the-messaging-and-iot) (IoT Weekend, December 2017)
* [Open sourcing the IoT](https://www.slideshare.net/paolopat/open-sourcing-the-iot) (IoT Day Italy, November 2017)
* [EnMasse : open sourcing the messaging & IoT](https://www.slideshare.net/paolopat/enmasse-open-sourcing-the-messaging-iot-81861295)(Red Hat Open Source Day, November 2017)
* Scaling out Eclipse Hono [video](https://www.youtube.com/watch?v=ht90EqXnV-o) and [slides](https://www.slideshare.net/dejanb/scaling-out-eclipse-hono) (EclipseCon Europe, October 2017)
* [Messaging for the cloud](https://www.slideshare.net/dejanb/messaging-for-the-cloud) (Voxxed Days Belgrad, October 2017)
* [EnMasse : open sourcing the messaging & IoT](https://www.slideshare.net/paolopat/enmasse-open-sourcing-the-messaging-iot) (JavaSI, October 2017)
* [Open sourcing the IoT](https://www.slideshare.net/paolopat/open-sourcing-the-iot-enmasse-running-on-kubernetes) (Agile IoT meetup, June 2017)
* [Messaging as a Service : building a scalable messaging service](https://www.slideshare.net/paolopat/messaging-as-a-service-building-a-scalable-messaging-service) (DevDay meetup, May 2017)
* [Messaging-as-a-Service](https://www.slideshare.net/UlfLilleengen/rivieradev-75928765) (RivieraDev, May 2017)


## Workshops

* [EnMasse and IoT Workshop](https://github.com/EnMasseProject/enmasse-workshop/)

## Examples

* [EnMasse and Hono](https://www.eclipse.org/hono/docs/deployment/openshift/)
* [EnMasse and Camel](https://github.com/abouchama/camel-enmasse-amqps)
* [OpenShift AMQP Clients](https://github.com/lulf/openshift-amqp-clients)
