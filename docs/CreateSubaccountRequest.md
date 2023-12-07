# VultRuby::CreateSubaccountRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **email** | **String** | Create a new sub-account with this email address. |  |
| **subaccount_name** | **String** | Your name for this sub-account. | [optional] |
| **subaccount_id** | **String** | Your ID for this sub-account. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateSubaccountRequest.new(
  email: null,
  subaccount_name: null,
  subaccount_id: null
)
```

