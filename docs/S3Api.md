# VultRuby::S3Api

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_object_storage**](S3Api.md#create_object_storage) | **POST** /object-storage | Create Object Storage |
| [**delete_object_storage**](S3Api.md#delete_object_storage) | **DELETE** /object-storage/{object-storage-id} | Delete Object Storage |
| [**get_object_storage**](S3Api.md#get_object_storage) | **GET** /object-storage/{object-storage-id} | Get Object Storage |
| [**list_object_storage_clusters**](S3Api.md#list_object_storage_clusters) | **GET** /object-storage/clusters | Get All Clusters |
| [**list_object_storages**](S3Api.md#list_object_storages) | **GET** /object-storage | List Object Storages |
| [**regenerate_object_storage_keys**](S3Api.md#regenerate_object_storage_keys) | **POST** /object-storage/{object-storage-id}/regenerate-keys | Regenerate Object Storage Keys |
| [**update_object_storage**](S3Api.md#update_object_storage) | **PUT** /object-storage/{object-storage-id} | Update Object Storage |


## create_object_storage

> <CreateObjectStorage202Response> create_object_storage(opts)

Create Object Storage

Create new Object Storage. The `cluster_id` attribute is required.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::S3Api.new
opts = {
  create_object_storage_request: VultRuby::CreateObjectStorageRequest.new({cluster_id: 37}) # CreateObjectStorageRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Object Storage
  result = api_instance.create_object_storage(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->create_object_storage: #{e}"
end
```

#### Using the create_object_storage_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateObjectStorage202Response>, Integer, Hash)> create_object_storage_with_http_info(opts)

```ruby
begin
  # Create Object Storage
  data, status_code, headers = api_instance.create_object_storage_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateObjectStorage202Response>
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->create_object_storage_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_object_storage_request** | [**CreateObjectStorageRequest**](CreateObjectStorageRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateObjectStorage202Response**](CreateObjectStorage202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_object_storage

> delete_object_storage(object_storage_id)

Delete Object Storage

Delete an Object Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::S3Api.new
object_storage_id = 'object_storage_id_example' # String | The [Object Storage id](#operation/list-object-storages).

begin
  # Delete Object Storage
  api_instance.delete_object_storage(object_storage_id)
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->delete_object_storage: #{e}"
end
```

#### Using the delete_object_storage_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_object_storage_with_http_info(object_storage_id)

```ruby
begin
  # Delete Object Storage
  data, status_code, headers = api_instance.delete_object_storage_with_http_info(object_storage_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->delete_object_storage_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object_storage_id** | **String** | The [Object Storage id](#operation/list-object-storages). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_object_storage

> <CreateObjectStorage202Response> get_object_storage(object_storage_id)

Get Object Storage

Get information about an Object Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::S3Api.new
object_storage_id = 'object_storage_id_example' # String | The [Object Storage id](#operation/list-object-storages).

begin
  # Get Object Storage
  result = api_instance.get_object_storage(object_storage_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->get_object_storage: #{e}"
end
```

#### Using the get_object_storage_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateObjectStorage202Response>, Integer, Hash)> get_object_storage_with_http_info(object_storage_id)

```ruby
begin
  # Get Object Storage
  data, status_code, headers = api_instance.get_object_storage_with_http_info(object_storage_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateObjectStorage202Response>
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->get_object_storage_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object_storage_id** | **String** | The [Object Storage id](#operation/list-object-storages). |  |

### Return type

[**CreateObjectStorage202Response**](CreateObjectStorage202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_object_storage_clusters

> <ListObjectStorageClusters200Response> list_object_storage_clusters(opts)

Get All Clusters

Get a list of all Object Storage Clusters.

### Examples

```ruby
require 'time'
require 'vult_ruby'

api_instance = VultRuby::S3Api.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # Get All Clusters
  result = api_instance.list_object_storage_clusters(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->list_object_storage_clusters: #{e}"
end
```

#### Using the list_object_storage_clusters_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListObjectStorageClusters200Response>, Integer, Hash)> list_object_storage_clusters_with_http_info(opts)

```ruby
begin
  # Get All Clusters
  data, status_code, headers = api_instance.list_object_storage_clusters_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListObjectStorageClusters200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->list_object_storage_clusters_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListObjectStorageClusters200Response**](ListObjectStorageClusters200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_object_storages

> <ListObjectStorages200Response> list_object_storages(opts)

List Object Storages

Get a list of all Object Storage in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::S3Api.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Object Storages
  result = api_instance.list_object_storages(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->list_object_storages: #{e}"
end
```

#### Using the list_object_storages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListObjectStorages200Response>, Integer, Hash)> list_object_storages_with_http_info(opts)

```ruby
begin
  # List Object Storages
  data, status_code, headers = api_instance.list_object_storages_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListObjectStorages200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->list_object_storages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListObjectStorages200Response**](ListObjectStorages200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## regenerate_object_storage_keys

> <RegenerateObjectStorageKeys201Response> regenerate_object_storage_keys(object_storage_id)

Regenerate Object Storage Keys

Regenerate the keys for an Object Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::S3Api.new
object_storage_id = 'object_storage_id_example' # String | The [Object Storage id](#operation/list-object-storages).

begin
  # Regenerate Object Storage Keys
  result = api_instance.regenerate_object_storage_keys(object_storage_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->regenerate_object_storage_keys: #{e}"
end
```

#### Using the regenerate_object_storage_keys_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RegenerateObjectStorageKeys201Response>, Integer, Hash)> regenerate_object_storage_keys_with_http_info(object_storage_id)

```ruby
begin
  # Regenerate Object Storage Keys
  data, status_code, headers = api_instance.regenerate_object_storage_keys_with_http_info(object_storage_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RegenerateObjectStorageKeys201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->regenerate_object_storage_keys_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object_storage_id** | **String** | The [Object Storage id](#operation/list-object-storages). |  |

### Return type

[**RegenerateObjectStorageKeys201Response**](RegenerateObjectStorageKeys201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_object_storage

> update_object_storage(object_storage_id, opts)

Update Object Storage

Update the label for an Object Storage.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::S3Api.new
object_storage_id = 'object_storage_id_example' # String | The [Object Storage id](#operation/list-object-storages).
opts = {
  update_object_storage_request: VultRuby::UpdateObjectStorageRequest.new({label: 'label_example'}) # UpdateObjectStorageRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Object Storage
  api_instance.update_object_storage(object_storage_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->update_object_storage: #{e}"
end
```

#### Using the update_object_storage_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_object_storage_with_http_info(object_storage_id, opts)

```ruby
begin
  # Update Object Storage
  data, status_code, headers = api_instance.update_object_storage_with_http_info(object_storage_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling S3Api->update_object_storage_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object_storage_id** | **String** | The [Object Storage id](#operation/list-object-storages). |  |
| **update_object_storage_request** | [**UpdateObjectStorageRequest**](UpdateObjectStorageRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

