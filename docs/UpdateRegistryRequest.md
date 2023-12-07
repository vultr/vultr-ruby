# VultrRuby::UpdateRegistryRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **public** | [**Public**](Public.md) |  | [optional] |
| **plan** | **String** | The key of the plan you&#39;d like to upgrade to which dictates how much storage you&#39;re allocated and the monthly cost. Can get list of plans from /plan/list endpoint i.e. business | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateRegistryRequest.new(
  public: null,
  plan: null
)
```

