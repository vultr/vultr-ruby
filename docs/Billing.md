# VultRuby::Billing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Float** | ID of the billing history item | [optional] |
| **date** | **String** | Date billing history item was generated | [optional] |
| **type** | **String** | Type of billing history item | [optional] |
| **description** | **String** | Description of billing history item | [optional] |
| **amount** | **Float** | Amount for the billing history item in dollars | [optional] |
| **balance** | **Float** | The accounts balance in dollars | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Billing.new(
  id: null,
  date: null,
  type: null,
  description: null,
  amount: null,
  balance: null
)
```

