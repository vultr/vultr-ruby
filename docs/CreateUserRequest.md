# VultrRuby::CreateUserRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **email** | **String** | The User&#39;s email address. |  |
| **name** | **String** | The User&#39;s name. |  |
| **password** | **String** | The User&#39;s password. |  |
| **api_enabled** | **Boolean** | API access is permitted for this User.  * true (default) * false | [optional] |
| **acls** | **Array&lt;String&gt;** | An array of permissions granted.  * abuse * alerts * billing * dns * firewall * loadbalancer * manage\\_users * objstore * provisioning * subscriptions * subscriptions\\_view * support * upgrade | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateUserRequest.new(
  email: null,
  name: null,
  password: null,
  api_enabled: null,
  acls: null
)
```

