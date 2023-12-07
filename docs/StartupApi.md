# VultrRuby::StartupApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_startup_script**](StartupApi.md#create_startup_script) | **POST** /startup-scripts | Create Startup Script |
| [**delete_startup_script**](StartupApi.md#delete_startup_script) | **DELETE** /startup-scripts/{startup-id} | Delete Startup Script |
| [**get_startup_script**](StartupApi.md#get_startup_script) | **GET** /startup-scripts/{startup-id} | Get Startup Script |
| [**list_startup_scripts**](StartupApi.md#list_startup_scripts) | **GET** /startup-scripts | List Startup Scripts |
| [**update_startup_script**](StartupApi.md#update_startup_script) | **PATCH** /startup-scripts/{startup-id} | Update Startup Script |


## create_startup_script

> <GetStartupScript200Response> create_startup_script(opts)

Create Startup Script

Create a new Startup Script. The `name` and `script` attributes are required, and scripts are base-64 encoded.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::StartupApi.new
opts = {
  create_startup_script_request: VultrRuby::CreateStartupScriptRequest.new({name: 'name_example', script: 'script_example'}) # CreateStartupScriptRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Startup Script
  result = api_instance.create_startup_script(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->create_startup_script: #{e}"
end
```

#### Using the create_startup_script_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStartupScript200Response>, Integer, Hash)> create_startup_script_with_http_info(opts)

```ruby
begin
  # Create Startup Script
  data, status_code, headers = api_instance.create_startup_script_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStartupScript200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->create_startup_script_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_startup_script_request** | [**CreateStartupScriptRequest**](CreateStartupScriptRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetStartupScript200Response**](GetStartupScript200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_startup_script

> delete_startup_script(startup_id)

Delete Startup Script

Delete a Startup Script.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::StartupApi.new
startup_id = 'startup_id_example' # String | The [Startup Script id](#operation/list-startup-scripts).

begin
  # Delete Startup Script
  api_instance.delete_startup_script(startup_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->delete_startup_script: #{e}"
end
```

#### Using the delete_startup_script_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_startup_script_with_http_info(startup_id)

```ruby
begin
  # Delete Startup Script
  data, status_code, headers = api_instance.delete_startup_script_with_http_info(startup_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->delete_startup_script_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **startup_id** | **String** | The [Startup Script id](#operation/list-startup-scripts). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_startup_script

> <GetStartupScript200Response> get_startup_script(startup_id)

Get Startup Script

Get information for a Startup Script.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::StartupApi.new
startup_id = 'startup_id_example' # String | The [Startup Script id](#operation/list-startup-scripts).

begin
  # Get Startup Script
  result = api_instance.get_startup_script(startup_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->get_startup_script: #{e}"
end
```

#### Using the get_startup_script_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStartupScript200Response>, Integer, Hash)> get_startup_script_with_http_info(startup_id)

```ruby
begin
  # Get Startup Script
  data, status_code, headers = api_instance.get_startup_script_with_http_info(startup_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStartupScript200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->get_startup_script_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **startup_id** | **String** | The [Startup Script id](#operation/list-startup-scripts). |  |

### Return type

[**GetStartupScript200Response**](GetStartupScript200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_startup_scripts

> <ListStartupScripts200Response> list_startup_scripts(opts)

List Startup Scripts

Get a list of all Startup Scripts.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::StartupApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Startup Scripts
  result = api_instance.list_startup_scripts(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->list_startup_scripts: #{e}"
end
```

#### Using the list_startup_scripts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListStartupScripts200Response>, Integer, Hash)> list_startup_scripts_with_http_info(opts)

```ruby
begin
  # List Startup Scripts
  data, status_code, headers = api_instance.list_startup_scripts_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListStartupScripts200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->list_startup_scripts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListStartupScripts200Response**](ListStartupScripts200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_startup_script

> update_startup_script(startup_id, opts)

Update Startup Script

Update a Startup Script. The attributes `name` and `script` are optional. If not set, the attributes will retain their original values. The `script` attribute is base-64 encoded. New deployments will use the updated script, but this action does not update previously deployed instances.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::StartupApi.new
startup_id = 'startup_id_example' # String | The [Startup Script id](#operation/list-startup-scripts).
opts = {
  update_startup_script_request: VultrRuby::UpdateStartupScriptRequest.new # UpdateStartupScriptRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Startup Script
  api_instance.update_startup_script(startup_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->update_startup_script: #{e}"
end
```

#### Using the update_startup_script_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_startup_script_with_http_info(startup_id, opts)

```ruby
begin
  # Update Startup Script
  data, status_code, headers = api_instance.update_startup_script_with_http_info(startup_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling StartupApi->update_startup_script_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **startup_id** | **String** | The [Startup Script id](#operation/list-startup-scripts). |  |
| **update_startup_script_request** | [**UpdateStartupScriptRequest**](UpdateStartupScriptRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

