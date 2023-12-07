# VultrRuby::ListInstanceVpcs200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **private_networks** | [**Array&lt;Vpc&gt;**](Vpc.md) |  | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListInstanceVpcs200Response.new(
  private_networks: null,
  meta: null
)
```

