# VultrRuby::ReinstallInstanceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hostname** | **String** | The hostname to use when reinstalling this instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ReinstallInstanceRequest.new(
  hostname: null
)
```

