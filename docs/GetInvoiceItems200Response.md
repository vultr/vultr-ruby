# VultRuby::GetInvoiceItems200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_items** | [**Array&lt;GetInvoiceItems200ResponseInvoiceItemsInner&gt;**](GetInvoiceItems200ResponseInvoiceItemsInner.md) | List of invoice items. | [optional] |
| **meta** | [**GetInvoiceItems200ResponseMeta**](GetInvoiceItems200ResponseMeta.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::GetInvoiceItems200Response.new(
  invoice_items: null,
  meta: null
)
```

