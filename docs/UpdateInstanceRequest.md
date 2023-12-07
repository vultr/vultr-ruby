# VultRuby::UpdateInstanceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **Integer** | Reinstall the instance with this [Application id](#operation/list-applications). | [optional] |
| **image_id** | **String** | Reinstall the instance with this [Application image_id](#operation/list-applications). | [optional] |
| **backups** | **String** | Enable automatic backups for the instance.  * enabled * disabled | [optional] |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups) to attach to this Instance. | [optional] |
| **enable_ipv6** | **Boolean** | Enable IPv6.  * true | [optional] |
| **os_id** | **String** | Reinstall the instance with this [ISO id](#operation/list-isos). | [optional] |
| **user_data** | **String** | The user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) to attach to this instance. | [optional] |
| **tag** | **String** | Use &#x60;tags&#x60; instead. The user-supplied tag. | [optional] |
| **plan** | **String** | Upgrade the instance with this [Plan id](#operation/list-plans). | [optional] |
| **ddos_protection** | **Boolean** | Enable DDoS Protection (there is an additional charge for this).  * true * false | [optional] |
| **attach_private_network** | **Array&lt;String&gt;** | Use &#x60;attach_vpc&#x60; instead. An array of [Private Network ids](#operation/list-networks) to attach to this Instance. This parameter takes precedence over &#x60;enable_private_network&#x60;. Please choose one parameter. | [optional] |
| **attach_vpc** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpcs) to attach to this Instance. This parameter takes precedence over &#x60;enable_vpc&#x60;. Please choose one parameter. | [optional] |
| **attach_vpc2** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpc2) to attach to this Instance. This parameter takes precedence over &#x60;enable_vpc2&#x60;. Please choose one parameter. | [optional] |
| **detach_private_network** | **Array&lt;String&gt;** | Use &#x60;detach_vpc&#x60; instead. An array of [Private Network ids](#operation/list-networks) to detach from this Instance. This parameter takes precedence over &#x60;enable_private_network&#x60;. | [optional] |
| **detach_vpc** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpcs) to detach from this Instance. This parameter takes precedence over &#x60;enable_vpc&#x60;. | [optional] |
| **detach_vpc2** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpc2) to detach from this Instance. This parameter takes precedence over &#x60;enable_vpc2&#x60;. | [optional] |
| **enable_private_network** | **Boolean** | Use &#x60;enable_vpc&#x60; instead.  If &#x60;true&#x60;, private networking support will be added to the new server.  This parameter attaches a single network. When no network exists in the region, it will be automatically created.  If there are multiple private networks in the instance&#39;s region, use &#x60;attach_private_network&#x60; instead to specify a network. | [optional] |
| **enable_vpc** | **Boolean** | If &#x60;true&#x60;, VPC support will be added to the new server.  This parameter attaches a single VPC. When no VPC exists in the region, it will be automatically created.  If there are multiple VPCs in the instance&#39;s region, use &#x60;attach_vpc&#x60; instead to specify a VPC. | [optional] |
| **enable_vpc2** | **Boolean** | If &#x60;true&#x60;, VPC 2.0 support will be added to the new server.  This parameter attaches a single VPC 2.0 netowrk. When no VPC 2.0 network exists in the region, it will be automatically created.  If there are multiple VPC 2.0 networks in the instance&#39;s region, use &#x60;attach_vpc2&#x60; instead to specify a VPC 2.0 network. | [optional] |
| **label** | **String** | The user supplied label. | [optional] |
| **tags** | **Array&lt;String&gt;** | Tags to apply to the instance. | [optional] |
| **user_scheme** | **String** | Linux-only: The user scheme used for logging into this instance. The instance must be reinstalled for this change to take effect.  * root * limited | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::UpdateInstanceRequest.new(
  app_id: null,
  image_id: null,
  backups: null,
  firewall_group_id: null,
  enable_ipv6: null,
  os_id: null,
  user_data: null,
  tag: null,
  plan: null,
  ddos_protection: null,
  attach_private_network: null,
  attach_vpc: null,
  attach_vpc2: null,
  detach_private_network: null,
  detach_vpc: null,
  detach_vpc2: null,
  enable_private_network: null,
  enable_vpc: null,
  enable_vpc2: null,
  label: null,
  tags: null,
  user_scheme: null
)
```

