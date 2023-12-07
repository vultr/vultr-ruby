# VultRuby::RegistryMetadataSubscriptionBilling

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **monthly_price** | **Float** | Monthly Price | [optional] |
| **pending_charges** | **Float** | The current charges for this subscription | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::RegistryMetadataSubscriptionBilling.new(
  monthly_price: null,
  pending_charges: null
)
```

