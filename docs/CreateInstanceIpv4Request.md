# VultrRuby::CreateInstanceIpv4Request

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reboot** | **Boolean** | Set if the server is rebooted immediately after the IPv4 address is created.  * true (default) * false | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateInstanceIpv4Request.new(
  reboot: null
)
```

