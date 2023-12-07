# VultRuby::DatabaseUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **username** | **String** | The username for the database user. | [optional] |
| **password** | **String** | The password for the database user. | [optional] |
| **encryption** | **String** | The password encryption for the database user (MySQL engine type only). * &#x60;Default (MySQL 8+)&#x60; * &#x60;Legacy (MySQL 5.x)&#x60; | [optional] |
| **access_control** | [**DatabaseUserAccessControl**](DatabaseUserAccessControl.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseUser.new(
  username: null,
  password: null,
  encryption: null,
  access_control: null
)
```

