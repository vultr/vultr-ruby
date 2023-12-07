# VultrRuby::CreateInstanceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **region** | **String** | The [Region id](#operation/list-regions) where the Instance is located. |  |
| **plan** | **String** | The [Plan id](#operation/list-plans) to use when deploying this instance. |  |
| **os_id** | **Integer** | The [Operating System id](#operation/list-os) to use when deploying this instance. | [optional] |
| **ipxe_chain_url** | **String** | The URL location of the iPXE chainloader. | [optional] |
| **iso_id** | **String** | The [ISO id](#operation/list-isos) to use when deploying this instance. | [optional] |
| **script_id** | **String** | The [Startup Script id](#operation/list-startup-scripts) to use when deploying this instance. | [optional] |
| **snapshot_id** | **String** | The [Snapshot id](#operation/list-snapshots) to use when deploying the instance. | [optional] |
| **enable_ipv6** | **Boolean** | Enable IPv6.  * true | [optional] |
| **disable_public_ipv4** | **Boolean** | Don&#39;t set up a public IPv4 address when IPv6 is enabled. Will not do anything unless &#x60;enable_ipv6&#x60; is also &#x60;true&#x60;.  * true | [optional] |
| **attach_private_network** | **Array&lt;String&gt;** | Use &#x60;attach_vpc&#x60; instead. An array of [Private Network ids](#operation/list-networks) to attach to this Instance. This parameter takes precedence over &#x60;enable_private_network&#x60;. Please choose one parameter. | [optional] |
| **attach_vpc** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpcs) to attach to this Instance. This parameter takes precedence over &#x60;enable_vpc&#x60;. Please choose one parameter. | [optional] |
| **attach_vpc2** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpc2) to attach to this Instance. This parameter takes precedence over &#x60;enable_vpc2&#x60;. Please choose one parameter. | [optional] |
| **label** | **String** | A user-supplied label for this instance. | [optional] |
| **sshkey_id** | **Array&lt;String&gt;** | The [SSH Key id](#operation/list-ssh-keys) to install on this instance. | [optional] |
| **backups** | **String** | Enable automatic backups for the instance.  * enabled * disabled | [optional] |
| **app_id** | **Integer** | The [Application id](#operation/list-applications) to use when deploying this instance. | [optional] |
| **image_id** | **String** | The [Application image_id](#operation/list-applications) to use when deploying this instance. | [optional] |
| **user_data** | **String** | The user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) to attach to this instance. | [optional] |
| **ddos_protection** | **Boolean** | Enable DDoS protection (there is an additional charge for this).  * true * false | [optional] |
| **activation_email** | **Boolean** | Notify by email after deployment.  * true * false (default) | [optional] |
| **hostname** | **String** | The hostname to use when deploying this instance. | [optional] |
| **tag** | **String** | Use &#x60;tags&#x60; instead. The user-supplied tag. | [optional] |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups) to attach to this Instance. | [optional] |
| **reserved_ipv4** | **String** | ID of the floating IP to use as the main IP of this server. | [optional] |
| **enable_private_network** | **Boolean** | Use &#x60;enable_vpc&#x60; instead.  If &#x60;true&#x60;, private networking support will be added to the new server.  This parameter attaches a single network. When no network exists in the region, it will be automatically created.  If there are multiple private networks in the instance&#39;s region, use &#x60;attach_private_network&#x60; instead to specify a network. | [optional] |
| **enable_vpc** | **Boolean** | If &#x60;true&#x60;, VPC support will be added to the new server.  This parameter attaches a single VPC. When no VPC exists in the region, it will be automatically created.  If there are multiple VPCs in the instance&#39;s region, use &#x60;attach_vpc&#x60; instead to specify a network. | [optional] |
| **enable_vpc2** | **Boolean** | If &#x60;true&#x60;, VPC 2.0 support will be added to the new server.  This parameter attaches a single VPC 2.0 network. When no VPC 2.0 network exists in the region, it will be automatically created.  If there are multiple VPC 2.0 networks in the instance&#39;s region, use &#x60;attach_vpc2&#x60; instead to specify a network. | [optional] |
| **tags** | **Array&lt;String&gt;** | Tags to apply to the instance | [optional] |
| **user_scheme** | **String** | Linux-only: The user scheme used for logging into this instance. By default, the \&quot;root\&quot; user is configured. Alternatively, a limited user with sudo permissions can be selected.  * root * limited | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateInstanceRequest.new(
  region: null,
  plan: null,
  os_id: null,
  ipxe_chain_url: null,
  iso_id: null,
  script_id: null,
  snapshot_id: null,
  enable_ipv6: null,
  disable_public_ipv4: null,
  attach_private_network: null,
  attach_vpc: null,
  attach_vpc2: null,
  label: null,
  sshkey_id: null,
  backups: null,
  app_id: null,
  image_id: null,
  user_data: null,
  ddos_protection: null,
  activation_email: null,
  hostname: null,
  tag: null,
  firewall_group_id: null,
  reserved_ipv4: null,
  enable_private_network: null,
  enable_vpc: null,
  enable_vpc2: null,
  tags: null,
  user_scheme: null
)
```

