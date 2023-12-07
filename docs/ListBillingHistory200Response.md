# VultRuby::ListBillingHistory200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_history** | [**Array&lt;Billing&gt;**](Billing.md) | List of all billing history. | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::ListBillingHistory200Response.new(
  billing_history: null,
  meta: null
)
```

