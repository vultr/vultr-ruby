# VultrRuby::Startup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Startup Script. | [optional] |
| **date_created** | **String** | The date the Startup Script was created. | [optional] |
| **date_modified** | **String** | The date the Startup Script was last modified. | [optional] |
| **name** | **String** | The user-supplied name of the Startup Script. | [optional] |
| **script** | **String** | The base-64 encoded Startup Script. | [optional] |
| **type** | **String** | The Startup Script type.  * boot * pxe | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Startup.new(
  id: null,
  date_created: null,
  date_modified: null,
  name: null,
  script: null,
  type: null
)
```

