# VultrRuby::Baremetal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Bare Metal instance. | [optional] |
| **os** | **String** | The [Operating System name](#operation/list-os). | [optional] |
| **ram** | **String** | Text description of the instances&#39; RAM. | [optional] |
| **disk** | **String** | Text description of the instances&#39; disk configuration. | [optional] |
| **main_ip** | **String** | The main IPv4 address. | [optional] |
| **cpu_count** | **Integer** | Number of CPUs. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the instance is located. | [optional] |
| **default_password** | **String** | The default password assigned at deployment. Only available for ten minutes after deployment. | [optional] |
| **date_created** | **String** | The date this instance was created. | [optional] |
| **status** | **String** | The current status.  * active * pending * suspended | [optional] |
| **netmask_v4** | **String** | The IPv4 netmask in dot-decimal notation. | [optional] |
| **gateway_v4** | **String** | The IPv4 gateway address. | [optional] |
| **plan** | **String** | The [Bare Metal Plan id](#operation/list-metal-plans) used by this instance. | [optional] |
| **label** | **String** | The user-supplied label for this instance. | [optional] |
| **tag** | **String** | Use &#x60;tags&#x60; instead. The user-supplied tag for this instance. | [optional] |
| **os_id** | **Integer** | The [Operating System id](#operation/list-os). | [optional] |
| **app_id** | **Integer** | The [Application id](#operation/list-applications). | [optional] |
| **image_id** | **String** | The [Application image_id](#operation/list-applications). | [optional] |
| **v6_network** | **String** | The IPv6 network size in bits. | [optional] |
| **v6_main_ip** | **String** | The main IPv6 network address. | [optional] |
| **v6_network_size** | **Integer** | The IPv6 subnet. | [optional] |
| **mac_address** | **Integer** | The MAC address for a Bare Metal server. | [optional] |
| **tags** | **Array&lt;String&gt;** | Tags to apply to the instance. | [optional] |
| **user_scheme** | **String** | The user scheme.  * root * limited | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Baremetal.new(
  id: null,
  os: null,
  ram: null,
  disk: null,
  main_ip: null,
  cpu_count: null,
  region: null,
  default_password: null,
  date_created: null,
  status: null,
  netmask_v4: null,
  gateway_v4: null,
  plan: null,
  label: null,
  tag: null,
  os_id: null,
  app_id: null,
  image_id: null,
  v6_network: null,
  v6_main_ip: null,
  v6_network_size: null,
  mac_address: null,
  tags: null,
  user_scheme: null
)
```

