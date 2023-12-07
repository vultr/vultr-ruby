# VultRuby::ListInvoices200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_invoices** | [**Array&lt;Invoice&gt;**](Invoice.md) | List of billing invoices. | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::ListInvoices200Response.new(
  billing_invoices: null,
  meta: null
)
```

