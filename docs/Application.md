# VultRuby::Application

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | A unique ID for the application. | [optional] |
| **name** | **String** | The application name. | [optional] |
| **short_name** | **String** | The short application name. | [optional] |
| **deploy_name** | **String** | A long description of the application. | [optional] |
| **type** | **String** | The type of application.  * one-click - use app_id to deploy one-click applications. * marketplace - use image_id to deploy marketplace applications. | [optional] |
| **vendor** | **String** | The application vendor name. | [optional] |
| **image_id** | **String** | A unique ID for marketplace applications. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Application.new(
  id: null,
  name: null,
  short_name: null,
  deploy_name: null,
  type: null,
  vendor: null,
  image_id: null
)
```

