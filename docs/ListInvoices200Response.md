# VultrRuby::ListInvoices200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_invoices** | [**Array&lt;Invoice&gt;**](Invoice.md) | List of billing invoices. | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListInvoices200Response.new(
  billing_invoices: null,
  meta: null
)
```

