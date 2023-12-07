# VultRuby::UpdateUserRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **email** | **String** | The User&#39;s email address. | [optional] |
| **name** | **String** | The User&#39;s name. | [optional] |
| **password** | **String** | The User&#39;s password. | [optional] |
| **api_enabled** | **Boolean** | API access is permitted for this User.  * true (default) * false | [optional] |
| **acls** | **Array&lt;String&gt;** | An array of permission granted. Valid values:  * abuse * alerts * billing * dns * firewall * loadbalancer * manage\\_users * objstore * provisioning * subscriptions * subscriptions\\_view * support * upgrade | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::UpdateUserRequest.new(
  email: null,
  name: null,
  password: null,
  api_enabled: null,
  acls: null
)
```

