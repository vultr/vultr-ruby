# VultrRuby::DatabaseAddReadReplicaRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **region** | **String** | The [Region id](#operation/list-regions) where the Managed Database is located. |  |
| **label** | **String** | A user-supplied label for this Managed Database. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseAddReadReplicaRequest.new(
  region: null,
  label: null
)
```

