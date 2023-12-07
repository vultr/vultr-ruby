# VultrRuby::CreateConnectionPoolRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the connection pool. |  |
| **database** | **String** | The logical database associated with the connection pool. |  |
| **username** | **String** | The database user associated with the connection pool. |  |
| **mode** | **String** | The mode for the connection pool. * &#x60;session&#x60; * &#x60;transaction&#x60; * &#x60;statement&#x60; |  |
| **size** | **Integer** | The size of the connection pool. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateConnectionPoolRequest.new(
  name: null,
  database: null,
  username: null,
  mode: null,
  size: null
)
```

