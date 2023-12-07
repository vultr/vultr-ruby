# VultRuby::IsoApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_iso**](IsoApi.md#create_iso) | **POST** /iso | Create ISO |
| [**delete_iso**](IsoApi.md#delete_iso) | **DELETE** /iso/{iso-id} | Delete ISO |
| [**iso_get**](IsoApi.md#iso_get) | **GET** /iso/{iso-id} | Get ISO |
| [**list_isos**](IsoApi.md#list_isos) | **GET** /iso | List ISOs |
| [**list_public_isos**](IsoApi.md#list_public_isos) | **GET** /iso-public | List Public ISOs |


## create_iso

> <CreateIso201Response> create_iso(opts)

Create ISO

Create a new ISO in your account from `url`.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::IsoApi.new
opts = {
  create_iso_request: VultRuby::CreateIsoRequest.new({url: 'url_example'}) # CreateIsoRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create ISO
  result = api_instance.create_iso(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->create_iso: #{e}"
end
```

#### Using the create_iso_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateIso201Response>, Integer, Hash)> create_iso_with_http_info(opts)

```ruby
begin
  # Create ISO
  data, status_code, headers = api_instance.create_iso_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateIso201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->create_iso_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_iso_request** | [**CreateIsoRequest**](CreateIsoRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateIso201Response**](CreateIso201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_iso

> delete_iso(iso_id)

Delete ISO

Delete an ISO.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::IsoApi.new
iso_id = 'iso_id_example' # String | The [ISO id](#operation/list-isos).

begin
  # Delete ISO
  api_instance.delete_iso(iso_id)
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->delete_iso: #{e}"
end
```

#### Using the delete_iso_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_iso_with_http_info(iso_id)

```ruby
begin
  # Delete ISO
  data, status_code, headers = api_instance.delete_iso_with_http_info(iso_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->delete_iso_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iso_id** | **String** | The [ISO id](#operation/list-isos). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## iso_get

> <CreateIso201Response> iso_get(iso_id)

Get ISO

Get information for an ISO.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::IsoApi.new
iso_id = 'iso_id_example' # String | The [ISO id](#operation/list-isos).

begin
  # Get ISO
  result = api_instance.iso_get(iso_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->iso_get: #{e}"
end
```

#### Using the iso_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateIso201Response>, Integer, Hash)> iso_get_with_http_info(iso_id)

```ruby
begin
  # Get ISO
  data, status_code, headers = api_instance.iso_get_with_http_info(iso_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateIso201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->iso_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iso_id** | **String** | The [ISO id](#operation/list-isos). |  |

### Return type

[**CreateIso201Response**](CreateIso201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_isos

> <ListIsos200Response> list_isos(opts)

List ISOs

Get the ISOs in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::IsoApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List ISOs
  result = api_instance.list_isos(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->list_isos: #{e}"
end
```

#### Using the list_isos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListIsos200Response>, Integer, Hash)> list_isos_with_http_info(opts)

```ruby
begin
  # List ISOs
  data, status_code, headers = api_instance.list_isos_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListIsos200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->list_isos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListIsos200Response**](ListIsos200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_public_isos

> <ListPublicIsos200Response> list_public_isos

List Public ISOs

List all Vultr Public ISOs.

### Examples

```ruby
require 'time'
require 'vult_ruby'

api_instance = VultRuby::IsoApi.new

begin
  # List Public ISOs
  result = api_instance.list_public_isos
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->list_public_isos: #{e}"
end
```

#### Using the list_public_isos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListPublicIsos200Response>, Integer, Hash)> list_public_isos_with_http_info

```ruby
begin
  # List Public ISOs
  data, status_code, headers = api_instance.list_public_isos_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListPublicIsos200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling IsoApi->list_public_isos_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListPublicIsos200Response**](ListPublicIsos200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

