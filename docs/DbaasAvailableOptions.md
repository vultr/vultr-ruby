# VultRuby::DbaasAvailableOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the configuration option. | [optional] |
| **type** | **String** | The type of the configuration option. * &#x60;int&#x60; * &#x60;float&#x60; * &#x60;bool&#x60; * &#x60;enum&#x60; | [optional] |
| **enumerals** | **Array&lt;String&gt;** | Valid enumerals for &#x60;enum&#x60; type configuration options only. | [optional] |
| **min_value** | [**Mixed**](Mixed.md) | The smallest value accepted for the configuration option. | [optional] |
| **max_value** | [**Mixed**](Mixed.md) | The largest value accepted for the configuration option. | [optional] |
| **alt_values** | [**Array&lt;Mixed&gt;**](Mixed.md) | Any alternate value accepted for the configuration option. | [optional] |
| **units** | **String** | The units associated with the configuration option. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DbaasAvailableOptions.new(
  name: null,
  type: null,
  enumerals: null,
  min_value: null,
  max_value: null,
  alt_values: null,
  units: null
)
```

