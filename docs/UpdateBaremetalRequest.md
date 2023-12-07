# VultRuby::UpdateBaremetalRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_data** | **String** | The user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) to attach to this instance. | [optional] |
| **label** | **String** | The user-supplied label. | [optional] |
| **tag** | **String** | Use &#x60;tags&#x60; instead. The user-supplied tag. | [optional] |
| **os_id** | **Integer** | If supplied, reinstall the instance using this [Operating System id](#operation/list-os). | [optional] |
| **app_id** | **Integer** | If supplied, reinstall the instance using this [Application id](#operation/list-applications). | [optional] |
| **image_id** | **String** | If supplied, reinstall the instance using this [Application image_id](#operation/list-applications). | [optional] |
| **enable_ipv6** | **Boolean** | Enable IPv6.  * true | [optional] |
| **attach_vpc2** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpc2) to attach to this Bare Metal Instance. This parameter takes precedence over &#x60;enable_vpc2&#x60;. Please choose one parameter. | [optional] |
| **detach_vpc2** | **Array&lt;String&gt;** | An array of [VPC IDs](#operation/list-vpc2) to detach from this Bare Metal Instance. This parameter takes precedence over &#x60;enable_vpc2&#x60;. | [optional] |
| **enable_vpc2** | **Boolean** | If &#x60;true&#x60;, VPC 2.0 support will be added to the new server.  This parameter attaches a single VPC 2.0 netowrk. When no VPC 2.0 network exists in the region, it will be automatically created.  If there are multiple VPC 2.0 networks in the instance&#39;s region, use &#x60;attach_vpc2&#x60; instead to specify a VPC 2.0 network. | [optional] |
| **tags** | **Array&lt;String&gt;** | Tags to apply to the instance. | [optional] |
| **user_scheme** | **String** | Linux-only: The user scheme used for logging into this instance. The instance must be reinstalled for this change to take effect.  * root * limited | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::UpdateBaremetalRequest.new(
  user_data: null,
  label: null,
  tag: null,
  os_id: null,
  app_id: null,
  image_id: null,
  enable_ipv6: null,
  attach_vpc2: null,
  detach_vpc2: null,
  enable_vpc2: null,
  tags: null,
  user_scheme: null
)
```

