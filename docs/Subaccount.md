# VultrRuby::Subaccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the sub-account. | [optional] |
| **email** | **String** | The email address of this sub-account. | [optional] |
| **subaccount_name** | **String** | Your name for this sub-account. | [optional] |
| **subaccount_id** | **String** | Your ID for this sub-account. | [optional] |
| **activated** | **Boolean** | Has this sub-account been activated or not. | [optional] |
| **balance** | **Float** | The current balance of the sub-account. | [optional] |
| **pending_charges** | **Float** | Charges due for this sub-account at the end of the billing period. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Subaccount.new(
  id: null,
  email: null,
  subaccount_name: null,
  subaccount_id: null,
  activated: null,
  balance: null,
  pending_charges: null
)
```

