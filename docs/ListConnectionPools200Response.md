# VultRuby::ListConnectionPools200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connections** | [**DatabaseConnections**](DatabaseConnections.md) |  | [optional] |
| **connection_pools** | [**Array&lt;ConnectionPool&gt;**](ConnectionPool.md) |  | [optional] |
| **meta** | [**DbaasMeta**](DbaasMeta.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::ListConnectionPools200Response.new(
  connections: null,
  connection_pools: null,
  meta: null
)
```

