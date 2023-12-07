# VultrRuby::DbaasAlerts

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **timestamp** | **String** | The date and time in which the alert was sent. | [optional] |
| **message_type** | **String** | The category of alert that was sent. * &#x60;DB MASTER PROMOTION&#x60; * &#x60;MAINTENANCE SCHEDULED&#x60; * &#x60;MISSING MYSQL PRIMARY KEYS&#x60; * &#x60;RESOURCE USAGE DISK&#x60; * &#x60;RESOURCE USAGE OOM KILLED&#x60; * &#x60;RESOURCE USAGE PG REPLICATION SLOTS&#x60; | [optional] |
| **description** | **String** | A verbose description of the associated alert category. | [optional] |
| **recommendation** | **String** | A description of the recommended action the customer should take. Only included for certain alert types. | [optional] |
| **maintenance_scheduled** | **String** | The time in which mandatory maintenance has been scheduled with the associated alert. Only included for certain alert types. | [optional] |
| **resource_type** | **String** | The affected resource related to the associated alert. Only included for certain alert types. | [optional] |
| **table_count** | **Integer** | The number of affected tables related to the associated alert. Only included for certain alert types. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DbaasAlerts.new(
  timestamp: null,
  message_type: null,
  description: null,
  recommendation: null,
  maintenance_scheduled: null,
  resource_type: null,
  table_count: null
)
```

