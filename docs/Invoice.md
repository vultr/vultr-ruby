# VultrRuby::Invoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the invoice | [optional] |
| **date** | **String** | Date invoice was generated | [optional] |
| **description** | **String** | description of item | [optional] |
| **amount** | **Float** | Amount due in dollars | [optional] |
| **balance** | **Float** | Account balance amount in dollars | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Invoice.new(
  id: null,
  date: null,
  description: null,
  amount: null,
  balance: null
)
```

