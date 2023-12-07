# VultrRuby::Instance

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the VPS Instance. | [optional] |
| **os** | **String** | The [Operating System name](#operation/list-os). | [optional] |
| **ram** | **Integer** | The amount of RAM in MB. | [optional] |
| **disk** | **Integer** | The size of the disk in GB. | [optional] |
| **main_ip** | **String** | The main IPv4 address. | [optional] |
| **vcpu_count** | **Integer** | Number of vCPUs. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the Instance is located. | [optional] |
| **default_password** | **String** | The default password assigned at deployment. Only available for ten minutes after deployment. | [optional] |
| **date_created** | **String** | The date this instance was created. | [optional] |
| **status** | **String** | The current status.  * active * pending * suspended * resizing | [optional] |
| **power_status** | **String** | The power-on status.  * running * stopped | [optional] |
| **server_status** | **String** | The server health status.  * none * locked * installingbooting * ok | [optional] |
| **allowed_bandwidth** | **Integer** | Monthly bandwidth quota in GB. | [optional] |
| **netmask_v4** | **String** | The IPv4 netmask in dot-decimal notation. | [optional] |
| **gateway_v4** | **String** | The gateway IP address. | [optional] |
| **v6_networks** | [**Array&lt;InstanceV6NetworksInner&gt;**](InstanceV6NetworksInner.md) | An array of IPv6 objects. | [optional] |
| **hostname** | **String** | The hostname for this instance. | [optional] |
| **label** | **String** | The user-supplied label for this instance. | [optional] |
| **tag** | **String** | Use &#x60;tags&#x60; instead. The user-supplied tag for this instance. | [optional] |
| **internal_ip** | **String** | The internal IP used by this instance, if set. Only relevant when a VPC is attached. | [optional] |
| **kvm** | **String** | HTTPS link to the Vultr noVNC Web Console. | [optional] |
| **os_id** | **Integer** | The [Operating System id](#operation/list-os) used by this instance. | [optional] |
| **app_id** | **Integer** | The [Application id](#operation/list-applications) used by this instance. | [optional] |
| **image_id** | **String** | The [Application image_id](#operation/list-applications) used by this instance. | [optional] |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups) linked to this Instance. | [optional] |
| **features** | **Array&lt;String&gt;** | \&quot;auto_backups\&quot;, \&quot;ipv6\&quot;, \&quot;ddos_protection\&quot; | [optional] |
| **plan** | **String** | A unique ID for the Plan. | [optional] |
| **tags** | **Array&lt;String&gt;** | Tags to apply to the instance. | [optional] |
| **user_scheme** | **String** | The user scheme.  * root * limited | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Instance.new(
  id: null,
  os: null,
  ram: null,
  disk: null,
  main_ip: null,
  vcpu_count: null,
  region: null,
  default_password: null,
  date_created: null,
  status: null,
  power_status: null,
  server_status: null,
  allowed_bandwidth: null,
  netmask_v4: null,
  gateway_v4: null,
  v6_networks: null,
  hostname: null,
  label: null,
  tag: null,
  internal_ip: null,
  kvm: null,
  os_id: null,
  app_id: null,
  image_id: null,
  firewall_group_id: null,
  features: null,
  plan: null,
  tags: null,
  user_scheme: null
)
```

