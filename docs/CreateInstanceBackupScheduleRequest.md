# VultrRuby::CreateInstanceBackupScheduleRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type of backup schedule:  |   | Value | Description | | - | ------ | ------------- | |   | daily | Back up once per day at &#x60;hour&#x60;. | |   | weekly | Back up once per week on &#x60;dow&#x60; at &#x60;hour&#x60;. | |   | monthly | Back up each month at &#x60;dom&#x60; at &#x60;hour&#x60;. | |   | daily\\_alt\\_even | Back up on even dates at &#x60;hour&#x60;. | |   | daily\\_alt\\_odd | Back up on odd dates at &#x60;hour&#x60;. | |  |
| **hour** | **Integer** | Hour of day to run in UTC. | [optional] |
| **dow** | **Integer** | Day of week to run.  |   | Value | Description | | - | ------ | ------------- | |   | 1 | Sunday | |   | 2 | Monday | |   | 3 | Tuesday | |   | 4 | Wednesday | |   | 5 | Thursday | |   | 6 | Friday | |   | 7 | Saturday | | [optional] |
| **dom** | **Integer** | Day of month to run. Use values between 1 and 28. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateInstanceBackupScheduleRequest.new(
  type: null,
  hour: null,
  dow: null,
  dom: null
)
```

