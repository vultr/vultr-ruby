# VultrRuby::UserUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The User&#39;s id. | [optional] |
| **name** | **String** | The User&#39;s name. | [optional] |
| **api_enabled** | **Boolean** | Permit API access for this User.  * true * false | [optional] |
| **email** | **String** | The User&#39;s email address. | [optional] |
| **password** | **String** | The User&#39;s password. | [optional] |
| **acls** | **Array&lt;String&gt;** | An array of permission granted.  * abuse * alerts * billing * dns * firewall * loadbalancer * manage\\_users * objstore * provisioning * subscriptions * subscriptions\\_view * support * upgrade | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UserUser.new(
  id: null,
  name: null,
  api_enabled: null,
  email: null,
  password: null,
  acls: null
)
```

