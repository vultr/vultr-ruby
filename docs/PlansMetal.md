# VultRuby::PlansMetal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Bare Metal Plan. | [optional] |
| **cpu_count** | **Integer** | The number of CPUs in this Plan. | [optional] |
| **cpu_model** | **String** | The CPU model type for this instance. | [optional] |
| **cpu_threads** | **Integer** | The numner of supported threads for this instance. | [optional] |
| **ram** | **Integer** | The amount of RAM in MB. | [optional] |
| **disk** | **String** | The disk size in GB. | [optional] |
| **bandwidth** | **Integer** | The monthly bandwidth quota in GB. | [optional] |
| **locations** | **Array&lt;String&gt;** | An array of Regions where this plan is valid for use. | [optional] |
| **type** | **String** | The plan type.  * SSD | [optional] |
| **monthly_cost** | **Integer** | The monthly cost in US Dollars. | [optional] |
| **disk_count** | **Integer** | The number of disks that this plan offers. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::PlansMetal.new(
  id: null,
  cpu_count: null,
  cpu_model: null,
  cpu_threads: null,
  ram: null,
  disk: null,
  bandwidth: null,
  locations: null,
  type: null,
  monthly_cost: null,
  disk_count: null
)
```

