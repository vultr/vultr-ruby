# VultRuby::GetInvoiceItems200ResponseInvoiceItemsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Invoice item description | [optional] |
| **product** | **String** | Product name | [optional] |
| **start_date** | **String** | Start date of item | [optional] |
| **end_date** | **String** | End date of item | [optional] |
| **units** | **Float** | Number of units item consumed in billing period | [optional] |
| **unit_type** | **String** | Unit type. Options include \&quot;hours\&quot;, \&quot;overage\&quot;, and \&quot;discount\&quot; | [optional] |
| **unit_price** | **Float** | Price per unit in dollars | [optional] |
| **total** | **Float** | Total amount due in dollars | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::GetInvoiceItems200ResponseInvoiceItemsInner.new(
  description: null,
  product: null,
  start_date: null,
  end_date: null,
  units: null,
  unit_type: null,
  unit_price: null,
  total: null
)
```

