# VultRuby::SshApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_ssh_key**](SshApi.md#create_ssh_key) | **POST** /ssh-keys | Create SSH key |
| [**delete_ssh_key**](SshApi.md#delete_ssh_key) | **DELETE** /ssh-keys/{ssh-key-id} | Delete SSH Key |
| [**get_ssh_key**](SshApi.md#get_ssh_key) | **GET** /ssh-keys/{ssh-key-id} | Get SSH Key |
| [**list_ssh_keys**](SshApi.md#list_ssh_keys) | **GET** /ssh-keys | List SSH Keys |
| [**update_ssh_key**](SshApi.md#update_ssh_key) | **PATCH** /ssh-keys/{ssh-key-id} | Update SSH Key |


## create_ssh_key

> <GetSshKey200Response> create_ssh_key(opts)

Create SSH key

Create a new SSH Key for use with future instances. This does not update any running instances.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::SshApi.new
opts = {
  create_ssh_key_request: VultRuby::CreateSshKeyRequest.new({name: 'name_example', ssh_key: 'ssh_key_example'}) # CreateSshKeyRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create SSH key
  result = api_instance.create_ssh_key(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->create_ssh_key: #{e}"
end
```

#### Using the create_ssh_key_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSshKey200Response>, Integer, Hash)> create_ssh_key_with_http_info(opts)

```ruby
begin
  # Create SSH key
  data, status_code, headers = api_instance.create_ssh_key_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSshKey200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->create_ssh_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_ssh_key_request** | [**CreateSshKeyRequest**](CreateSshKeyRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetSshKey200Response**](GetSshKey200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_ssh_key

> delete_ssh_key(ssh_key_id)

Delete SSH Key

Delete an SSH Key.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::SshApi.new
ssh_key_id = 'ssh_key_id_example' # String | The [SSH Key id](#operation/list-ssh-keys).

begin
  # Delete SSH Key
  api_instance.delete_ssh_key(ssh_key_id)
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->delete_ssh_key: #{e}"
end
```

#### Using the delete_ssh_key_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_ssh_key_with_http_info(ssh_key_id)

```ruby
begin
  # Delete SSH Key
  data, status_code, headers = api_instance.delete_ssh_key_with_http_info(ssh_key_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->delete_ssh_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ssh_key_id** | **String** | The [SSH Key id](#operation/list-ssh-keys). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_ssh_key

> <GetSshKey200Response> get_ssh_key(ssh_key_id)

Get SSH Key

Get information about an SSH Key.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::SshApi.new
ssh_key_id = 'ssh_key_id_example' # String | The [SSH Key id](#operation/list-ssh-keys).

begin
  # Get SSH Key
  result = api_instance.get_ssh_key(ssh_key_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->get_ssh_key: #{e}"
end
```

#### Using the get_ssh_key_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSshKey200Response>, Integer, Hash)> get_ssh_key_with_http_info(ssh_key_id)

```ruby
begin
  # Get SSH Key
  data, status_code, headers = api_instance.get_ssh_key_with_http_info(ssh_key_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSshKey200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->get_ssh_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ssh_key_id** | **String** | The [SSH Key id](#operation/list-ssh-keys). |  |

### Return type

[**GetSshKey200Response**](GetSshKey200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_ssh_keys

> <ListSshKeys200Response> list_ssh_keys(opts)

List SSH Keys

List all SSH Keys in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::SshApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500. 
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List SSH Keys
  result = api_instance.list_ssh_keys(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->list_ssh_keys: #{e}"
end
```

#### Using the list_ssh_keys_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListSshKeys200Response>, Integer, Hash)> list_ssh_keys_with_http_info(opts)

```ruby
begin
  # List SSH Keys
  data, status_code, headers = api_instance.list_ssh_keys_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListSshKeys200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->list_ssh_keys_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500.  | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListSshKeys200Response**](ListSshKeys200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_ssh_key

> update_ssh_key(ssh_key_id, opts)

Update SSH Key

Update an SSH Key. The attributes `name` and `ssh_key` are optional. If not set, the attributes will retain their original values. New deployments will use the updated key, but this action does not update previously deployed instances.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::SshApi.new
ssh_key_id = 'ssh_key_id_example' # String | The [SSH Key id](#operation/list-ssh-keys).
opts = {
  update_ssh_key_request: VultRuby::UpdateSshKeyRequest.new # UpdateSshKeyRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update SSH Key
  api_instance.update_ssh_key(ssh_key_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->update_ssh_key: #{e}"
end
```

#### Using the update_ssh_key_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_ssh_key_with_http_info(ssh_key_id, opts)

```ruby
begin
  # Update SSH Key
  data, status_code, headers = api_instance.update_ssh_key_with_http_info(ssh_key_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling SshApi->update_ssh_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ssh_key_id** | **String** | The [SSH Key id](#operation/list-ssh-keys). |  |
| **update_ssh_key_request** | [**UpdateSshKeyRequest**](UpdateSshKeyRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

