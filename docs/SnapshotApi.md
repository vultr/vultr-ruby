# VultrRuby::SnapshotApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_snapshot**](SnapshotApi.md#create_snapshot) | **POST** /snapshots | Create Snapshot |
| [**create_snapshot_create_from_url**](SnapshotApi.md#create_snapshot_create_from_url) | **POST** /snapshots/create-from-url | Create Snapshot from URL |
| [**delete_snapshot**](SnapshotApi.md#delete_snapshot) | **DELETE** /snapshots/{snapshot-id} | Delete Snapshot |
| [**get_snapshot**](SnapshotApi.md#get_snapshot) | **GET** /snapshots/{snapshot-id} | Get Snapshot |
| [**list_snapshots**](SnapshotApi.md#list_snapshots) | **GET** /snapshots | List Snapshots |
| [**put_snapshots_snapshot_id**](SnapshotApi.md#put_snapshots_snapshot_id) | **PUT** /snapshots/{snapshot-id} | Update Snapshot |


## create_snapshot

> <GetSnapshot200Response> create_snapshot(opts)

Create Snapshot

Create a new Snapshot for `instance_id`.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SnapshotApi.new
opts = {
  create_snapshot_request: VultrRuby::CreateSnapshotRequest.new({instance_id: 'instance_id_example'}) # CreateSnapshotRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Snapshot
  result = api_instance.create_snapshot(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->create_snapshot: #{e}"
end
```

#### Using the create_snapshot_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSnapshot200Response>, Integer, Hash)> create_snapshot_with_http_info(opts)

```ruby
begin
  # Create Snapshot
  data, status_code, headers = api_instance.create_snapshot_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSnapshot200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->create_snapshot_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_snapshot_request** | [**CreateSnapshotRequest**](CreateSnapshotRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetSnapshot200Response**](GetSnapshot200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_snapshot_create_from_url

> <GetSnapshot200Response> create_snapshot_create_from_url(opts)

Create Snapshot from URL

Create a new Snapshot from a RAW image located at `url`.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SnapshotApi.new
opts = {
  create_snapshot_create_from_url_request: VultrRuby::CreateSnapshotCreateFromUrlRequest.new({url: 'url_example'}) # CreateSnapshotCreateFromUrlRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Snapshot from URL
  result = api_instance.create_snapshot_create_from_url(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->create_snapshot_create_from_url: #{e}"
end
```

#### Using the create_snapshot_create_from_url_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSnapshot200Response>, Integer, Hash)> create_snapshot_create_from_url_with_http_info(opts)

```ruby
begin
  # Create Snapshot from URL
  data, status_code, headers = api_instance.create_snapshot_create_from_url_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSnapshot200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->create_snapshot_create_from_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_snapshot_create_from_url_request** | [**CreateSnapshotCreateFromUrlRequest**](CreateSnapshotCreateFromUrlRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetSnapshot200Response**](GetSnapshot200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_snapshot

> delete_snapshot(snapshot_id)

Delete Snapshot

Delete a Snapshot.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SnapshotApi.new
snapshot_id = 'snapshot_id_example' # String | The [Snapshot id](#operation/list-snapshots).

begin
  # Delete Snapshot
  api_instance.delete_snapshot(snapshot_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->delete_snapshot: #{e}"
end
```

#### Using the delete_snapshot_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_snapshot_with_http_info(snapshot_id)

```ruby
begin
  # Delete Snapshot
  data, status_code, headers = api_instance.delete_snapshot_with_http_info(snapshot_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->delete_snapshot_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **snapshot_id** | **String** | The [Snapshot id](#operation/list-snapshots). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_snapshot

> <GetSnapshot200Response> get_snapshot(snapshot_id)

Get Snapshot

Get information about a Snapshot.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SnapshotApi.new
snapshot_id = 'snapshot_id_example' # String | The [Snapshot id](#operation/list-snapshots).

begin
  # Get Snapshot
  result = api_instance.get_snapshot(snapshot_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->get_snapshot: #{e}"
end
```

#### Using the get_snapshot_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSnapshot200Response>, Integer, Hash)> get_snapshot_with_http_info(snapshot_id)

```ruby
begin
  # Get Snapshot
  data, status_code, headers = api_instance.get_snapshot_with_http_info(snapshot_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSnapshot200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->get_snapshot_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **snapshot_id** | **String** | The [Snapshot id](#operation/list-snapshots). |  |

### Return type

[**GetSnapshot200Response**](GetSnapshot200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_snapshots

> <ListSnapshots200Response> list_snapshots(opts)

List Snapshots

Get information about all Snapshots in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SnapshotApi.new
opts = {
  description: 'description_example', # String | Filter the list of Snapshots by `description`
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Snapshots
  result = api_instance.list_snapshots(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->list_snapshots: #{e}"
end
```

#### Using the list_snapshots_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListSnapshots200Response>, Integer, Hash)> list_snapshots_with_http_info(opts)

```ruby
begin
  # List Snapshots
  data, status_code, headers = api_instance.list_snapshots_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListSnapshots200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->list_snapshots_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Filter the list of Snapshots by &#x60;description&#x60; | [optional] |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListSnapshots200Response**](ListSnapshots200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## put_snapshots_snapshot_id

> put_snapshots_snapshot_id(snapshot_id, opts)

Update Snapshot

Update the description for a Snapshot.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SnapshotApi.new
snapshot_id = 'snapshot_id_example' # String | The [Snapshot id](#operation/list-snapshots).
opts = {
  put_snapshots_snapshot_id_request: VultrRuby::PutSnapshotsSnapshotIdRequest.new({description: 'description_example'}) # PutSnapshotsSnapshotIdRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Snapshot
  api_instance.put_snapshots_snapshot_id(snapshot_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->put_snapshots_snapshot_id: #{e}"
end
```

#### Using the put_snapshots_snapshot_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> put_snapshots_snapshot_id_with_http_info(snapshot_id, opts)

```ruby
begin
  # Update Snapshot
  data, status_code, headers = api_instance.put_snapshots_snapshot_id_with_http_info(snapshot_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling SnapshotApi->put_snapshots_snapshot_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **snapshot_id** | **String** | The [Snapshot id](#operation/list-snapshots). |  |
| **put_snapshots_snapshot_id_request** | [**PutSnapshotsSnapshotIdRequest**](PutSnapshotsSnapshotIdRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

