# VultRuby::BlockApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**attach_block**](BlockApi.md#attach_block) | **POST** /blocks/{block-id}/attach | Attach Block Storage |
| [**create_block**](BlockApi.md#create_block) | **POST** /blocks | Create Block Storage |
| [**delete_block**](BlockApi.md#delete_block) | **DELETE** /blocks/{block-id} | Delete Block Storage |
| [**detach_block**](BlockApi.md#detach_block) | **POST** /blocks/{block-id}/detach | Detach Block Storage |
| [**get_block**](BlockApi.md#get_block) | **GET** /blocks/{block-id} | Get Block Storage |
| [**list_blocks**](BlockApi.md#list_blocks) | **GET** /blocks | List Block storages |
| [**update_block**](BlockApi.md#update_block) | **PATCH** /blocks/{block-id} | Update Block Storage |


## attach_block

> attach_block(block_id, opts)

Attach Block Storage

Attach Block Storage to Instance `instance_id`.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
block_id = 'block_id_example' # String | The [Block Storage id](#operation/list-blocks).
opts = {
  attach_block_request: VultRuby::AttachBlockRequest.new({instance_id: 'instance_id_example'}) # AttachBlockRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach Block Storage
  api_instance.attach_block(block_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->attach_block: #{e}"
end
```

#### Using the attach_block_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_block_with_http_info(block_id, opts)

```ruby
begin
  # Attach Block Storage
  data, status_code, headers = api_instance.attach_block_with_http_info(block_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->attach_block_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_id** | **String** | The [Block Storage id](#operation/list-blocks). |  |
| **attach_block_request** | [**AttachBlockRequest**](AttachBlockRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_block

> <CreateBlock202Response> create_block(opts)

Create Block Storage

Create new Block Storage in a `region` with a size of `size_gb`. Size may range between 10 and 40000 depending on the `block_type`.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
opts = {
  create_block_request: VultRuby::CreateBlockRequest.new({region: 'region_example', size_gb: 37}) # CreateBlockRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Block Storage
  result = api_instance.create_block(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->create_block: #{e}"
end
```

#### Using the create_block_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateBlock202Response>, Integer, Hash)> create_block_with_http_info(opts)

```ruby
begin
  # Create Block Storage
  data, status_code, headers = api_instance.create_block_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateBlock202Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->create_block_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_block_request** | [**CreateBlockRequest**](CreateBlockRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateBlock202Response**](CreateBlock202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_block

> delete_block(block_id)

Delete Block Storage

Delete Block Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
block_id = 'block_id_example' # String | The [Block Storage id](#operation/list-blocks).

begin
  # Delete Block Storage
  api_instance.delete_block(block_id)
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->delete_block: #{e}"
end
```

#### Using the delete_block_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_block_with_http_info(block_id)

```ruby
begin
  # Delete Block Storage
  data, status_code, headers = api_instance.delete_block_with_http_info(block_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->delete_block_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_id** | **String** | The [Block Storage id](#operation/list-blocks). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## detach_block

> detach_block(block_id, opts)

Detach Block Storage

Detach Block Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
block_id = 'block_id_example' # String | The [Block Storage id](#operation/list-blocks).
opts = {
  detach_block_request: VultRuby::DetachBlockRequest.new # DetachBlockRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Detach Block Storage
  api_instance.detach_block(block_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->detach_block: #{e}"
end
```

#### Using the detach_block_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_block_with_http_info(block_id, opts)

```ruby
begin
  # Detach Block Storage
  data, status_code, headers = api_instance.detach_block_with_http_info(block_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->detach_block_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_id** | **String** | The [Block Storage id](#operation/list-blocks). |  |
| **detach_block_request** | [**DetachBlockRequest**](DetachBlockRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## get_block

> <CreateBlock202Response> get_block(block_id)

Get Block Storage

Get information for Block Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
block_id = 'block_id_example' # String | The [Block Storage id](#operation/list-blocks).

begin
  # Get Block Storage
  result = api_instance.get_block(block_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->get_block: #{e}"
end
```

#### Using the get_block_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateBlock202Response>, Integer, Hash)> get_block_with_http_info(block_id)

```ruby
begin
  # Get Block Storage
  data, status_code, headers = api_instance.get_block_with_http_info(block_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateBlock202Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->get_block_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_id** | **String** | The [Block Storage id](#operation/list-blocks). |  |

### Return type

[**CreateBlock202Response**](CreateBlock202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_blocks

> <ListBlocks200Response> list_blocks(opts)

List Block storages

List all Block Storage in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Block storages
  result = api_instance.list_blocks(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->list_blocks: #{e}"
end
```

#### Using the list_blocks_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBlocks200Response>, Integer, Hash)> list_blocks_with_http_info(opts)

```ruby
begin
  # List Block storages
  data, status_code, headers = api_instance.list_blocks_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBlocks200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->list_blocks_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListBlocks200Response**](ListBlocks200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_block

> update_block(block_id, opts)

Update Block Storage

Update information for Block Storage. 

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BlockApi.new
block_id = 'block_id_example' # String | The [Block Storage id](#operation/list-blocks).
opts = {
  update_block_request: VultRuby::UpdateBlockRequest.new # UpdateBlockRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Block Storage
  api_instance.update_block(block_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->update_block: #{e}"
end
```

#### Using the update_block_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_block_with_http_info(block_id, opts)

```ruby
begin
  # Update Block Storage
  data, status_code, headers = api_instance.update_block_with_http_info(block_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling BlockApi->update_block_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_id** | **String** | The [Block Storage id](#operation/list-blocks). |  |
| **update_block_request** | [**UpdateBlockRequest**](UpdateBlockRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

