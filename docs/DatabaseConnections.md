# VultRuby::DatabaseConnections

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **used** | **Integer** | The number of used database connections. | [optional] |
| **available** | **Integer** | The number of available database connections. | [optional] |
| **max** | **Integer** | The maximum number of database connections. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseConnections.new(
  used: null,
  available: null,
  max: null
)
```

