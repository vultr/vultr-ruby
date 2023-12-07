# VultrRuby::ListAvailableVersions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available_versions** | **Array&lt;String&gt;** | A list of available versions greater than the current version of the Managed Database. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListAvailableVersions200Response.new(
  available_versions: null
)
```

