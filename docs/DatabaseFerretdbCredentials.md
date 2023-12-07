# VultRuby::DatabaseFerretdbCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **host** | **String** | The public hostname for FerretDB database connections. | [optional] |
| **port** | **Integer** | The assigned port for connecting to the FerretDB instance. | [optional] |
| **username** | **String** | The username for connecting to the FerretDB instance. | [optional] |
| **password** | **String** | The password for connecting to the FerretDB instance. | [optional] |
| **public_ip** | **String** | The public IP address of the FerretDB instance. | [optional] |
| **private_ip** | **String** | The private IP address of the FerretDB instance when attached to a VPC network. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseFerretdbCredentials.new(
  host: null,
  port: null,
  username: null,
  password: null,
  public_ip: null,
  private_ip: null
)
```

