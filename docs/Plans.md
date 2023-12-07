# VultRuby::Plans

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Plan. | [optional] |
| **name** | **String** | The Plan name. | [optional] |
| **vcpu_count** | **Integer** | The number of vCPUs in this Plan. | [optional] |
| **ram** | **Integer** | The amount of RAM in MB. | [optional] |
| **disk** | **Integer** | The disk size in GB. | [optional] |
| **bandwidth** | **Integer** | The monthly bandwidth quota in GB. | [optional] |
| **monthly_cost** | **Integer** | The monthly cost in US Dollars. | [optional] |
| **type** | **String** | The plan type.  |   | Type | Description | | - | ------ | ------------- | |   | vc2 | Cloud Compute | |   | vhf | High Frequency Compute | |   | vdc | Dedicated Cloud | | [optional] |
| **locations** | **Array&lt;String&gt;** | An array of Regions where this plan is valid for use. | [optional] |
| **disk_count** | **Integer** | The number of disks that this plan offers. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Plans.new(
  id: null,
  name: null,
  vcpu_count: null,
  ram: null,
  disk: null,
  bandwidth: null,
  monthly_cost: null,
  type: null,
  locations: null,
  disk_count: null
)
```

