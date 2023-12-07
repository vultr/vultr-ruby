# VultRuby::ConnectionPool

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the connection pool. | [optional] |
| **database** | **String** | The logical database associated with the connection pool. | [optional] |
| **username** | **String** | The database user associated with the connection pool. | [optional] |
| **mode** | **String** | The mode for the connection pool. * &#x60;session&#x60; * &#x60;transaction&#x60; * &#x60;statement&#x60; | [optional] |
| **size** | **Integer** | The size of the connection pool. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::ConnectionPool.new(
  name: null,
  database: null,
  username: null,
  mode: null,
  size: null
)
```

