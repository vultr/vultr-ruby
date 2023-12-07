# VultRuby::Account

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Your user name. | [optional] |
| **email** | **String** | Your email address. | [optional] |
| **acls** | **Array&lt;String&gt;** | An array of permission granted. * manage\\_users * subscriptions_view * subscriptions * billing * support * provisioning * dns * abuse * upgrade * firewall * alerts * objstore * loadbalancer | [optional] |
| **balance** | **Float** | Your current account balance. | [optional] |
| **pending_charges** | **Float** | Unbilled charges for this month. | [optional] |
| **last_payment_date** | **String** | Date of your last payment. | [optional] |
| **last_payment_amount** | **Float** | The amount of your last payment. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Account.new(
  name: null,
  email: null,
  acls: null,
  balance: null,
  pending_charges: null,
  last_payment_date: null,
  last_payment_amount: null
)
```

