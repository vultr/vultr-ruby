# VultrRuby::DbaasPlan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the plan. | [optional] |
| **number_of_nodes** | **Integer** | The total number of nodes for this plan. | [optional] |
| **type** | **String** | The type of plan this is. | [optional] |
| **vcpu_count** | **Integer** | Number of vCPUs. | [optional] |
| **ram** | **Integer** | The amount of RAM in MB. | [optional] |
| **disk** | **Integer** | The size of the disk in GB (excluded for Redis engine types). | [optional] |
| **monthly_cost** | **Integer** | The monthly cost of this Managed Database plan. | [optional] |
| **supported_engines** | **Object** | A list of key/value pairs with database engine types and boolean values. | [optional] |
| **max_connections** | **Object** | A list of key/value pairs with database engine types (excluding Redis) and integers of max connection values. | [optional] |
| **locations** | **Array&lt;String&gt;** | A list of available regions in which this plan is currently available. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DbaasPlan.new(
  id: null,
  number_of_nodes: null,
  type: null,
  vcpu_count: null,
  ram: null,
  disk: null,
  monthly_cost: null,
  supported_engines: null,
  max_connections: null,
  locations: null
)
```

