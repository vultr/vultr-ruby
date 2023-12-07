# VultrRuby::RegistryPlan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vanity_name** | **String** | The Nice Name of the plan | [optional] |
| **max_storage_mb** | **Integer** | The total allocated storage this plan allows | [optional] |
| **monthly_price** | **Integer** | The monthly price for this plan | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::RegistryPlan.new(
  vanity_name: null,
  max_storage_mb: null,
  monthly_price: null
)
```

