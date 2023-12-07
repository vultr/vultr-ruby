# VultRuby::FirewallGroup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Firewall Group. | [optional] |
| **description** | **String** | User-supplied description of this Firewall Group. | [optional] |
| **date_created** | **String** | Date the Firewall Group was originally created. | [optional] |
| **date_modified** | **String** | Date of the last modification to this Firewall Group. | [optional] |
| **instance_count** | **Integer** | The number of instances linked to this Firewall Group. | [optional] |
| **rule_count** | **Integer** | The number of rules in this Firewall Group. | [optional] |
| **max_rule_count** | **Integer** | The maximum number of rules allowed for this Firewall Group. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::FirewallGroup.new(
  id: null,
  description: null,
  date_created: null,
  date_modified: null,
  instance_count: null,
  rule_count: null,
  max_rule_count: null
)
```

