# VultrRuby::ReinstallBaremetalRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hostname** | **String** | The hostname to use when reinstalling this bare metal server. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ReinstallBaremetalRequest.new(
  hostname: null
)
```

