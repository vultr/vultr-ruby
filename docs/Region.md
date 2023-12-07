# VultrRuby::Region

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Region. | [optional] |
| **country** | **String** | The [two-letter country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) for this Region. | [optional] |
| **options** | **Array&lt;String&gt;** | An array of product features available in this Region. | [optional] |
| **continent** | **String** | The name of the continent for this Region. | [optional] |
| **city** | **String** | The name of the city for this Region. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Region.new(
  id: null,
  country: null,
  options: null,
  continent: null,
  city: null
)
```

