# VultrRuby::DbaasMigrationCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **host** | **String** | The host name of the source server. | [optional] |
| **port** | **Integer** | The connection port of the source server. | [optional] |
| **username** | **String** | The username of the source server. | [optional] |
| **password** | **String** | The password of the source server. | [optional] |
| **database** | **String** | The database of the source server. Excluded for Redis engine types. | [optional] |
| **ignored_databases** | **String** | Comma-separated list of ignored databases on the source server. Excluded for Redis engine types. | [optional] |
| **ssl** | **Boolean** | The true/false value for whether SSL is needed to connect to the source server. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DbaasMigrationCredentials.new(
  host: null,
  port: null,
  username: null,
  password: null,
  database: null,
  ignored_databases: null,
  ssl: null
)
```

