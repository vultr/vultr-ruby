# VultrRuby::UpdateStartupScriptRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the Startup Script. | [optional] |
| **script** | **String** | The base-64 encoded Startup Script. | [optional] |
| **type** | **String** | The Startup Script type.  boot (default) pxe | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateStartupScriptRequest.new(
  name: null,
  script: null,
  type: null
)
```

