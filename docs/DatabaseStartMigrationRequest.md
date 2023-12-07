# VultrRuby::DatabaseStartMigrationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **host** | **String** | The host name of the source server. |  |
| **port** | **Integer** | The connection port of the source server. |  |
| **username** | **String** | The username of the source server. Uses &#x60;default&#x60; for Redis if left empty or unset. |  |
| **password** | **String** | The password of the source server. |  |
| **database** | **String** | The database of the source server. Required for MySQL/PostgreSQL engine types, but excluded for Redis. | [optional] |
| **ignored_databases** | **String** | Comma-separated list of ignored databases on the source server. Excluded for Redis engine types. | [optional] |
| **ssl** | **Boolean** | The true/false value for whether SSL is needed to connect to the source server. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseStartMigrationRequest.new(
  host: null,
  port: null,
  username: null,
  password: null,
  database: null,
  ignored_databases: null,
  ssl: null
)
```

