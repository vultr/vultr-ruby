# VultrRuby::ListBillingHistory200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_history** | [**Array&lt;Billing&gt;**](Billing.md) | List of all billing history. | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListBillingHistory200Response.new(
  billing_history: null,
  meta: null
)
```

