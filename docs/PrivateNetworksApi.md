# VultRuby::PrivateNetworksApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_network**](PrivateNetworksApi.md#create_network) | **POST** /private-networks | Create a Private Network |
| [**delete_network**](PrivateNetworksApi.md#delete_network) | **DELETE** /private-networks/{network-id} | Delete a private network |
| [**get_network**](PrivateNetworksApi.md#get_network) | **GET** /private-networks/{network-id} | Get a private network |
| [**list_networks**](PrivateNetworksApi.md#list_networks) | **GET** /private-networks | List Private Networks |
| [**update_network**](PrivateNetworksApi.md#update_network) | **PUT** /private-networks/{network-id} | Update a Private Network |


## create_network

> <GetNetwork200Response> create_network(opts)

Create a Private Network

Create a new Private Network in a `region`.  **Deprecated**: Use [Create VPC](#operation/create-vpc) instead.      Private networks should use [RFC1918 private address space](https://tools.ietf.org/html/rfc1918):      10.0.0.0    - 10.255.255.255  (10/8 prefix)     172.16.0.0  - 172.31.255.255  (172.16/12 prefix)     192.168.0.0 - 192.168.255.255 (192.168/16 prefix) 

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::PrivateNetworksApi.new
opts = {
  create_network_request: VultRuby::CreateNetworkRequest.new({region: 'region_example'}) # CreateNetworkRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create a Private Network
  result = api_instance.create_network(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->create_network: #{e}"
end
```

#### Using the create_network_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetNetwork200Response>, Integer, Hash)> create_network_with_http_info(opts)

```ruby
begin
  # Create a Private Network
  data, status_code, headers = api_instance.create_network_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetNetwork200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->create_network_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_network_request** | [**CreateNetworkRequest**](CreateNetworkRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetNetwork200Response**](GetNetwork200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_network

> delete_network(network_id)

Delete a private network

Delete a Private Network.<br><br>**Deprecated**: Use [Delete VPC](#operation/delete-vpc) instead.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::PrivateNetworksApi.new
network_id = 'network_id_example' # String | The [Network id](#operation/list-networks).

begin
  # Delete a private network
  api_instance.delete_network(network_id)
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->delete_network: #{e}"
end
```

#### Using the delete_network_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_network_with_http_info(network_id)

```ruby
begin
  # Delete a private network
  data, status_code, headers = api_instance.delete_network_with_http_info(network_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->delete_network_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network_id** | **String** | The [Network id](#operation/list-networks). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_network

> <GetNetwork200Response> get_network(network_id)

Get a private network

Get information about a Private Network.<br><br>**Deprecated**: Use [Get VPC](#operation/get-vpc) instead. 

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::PrivateNetworksApi.new
network_id = 'network_id_example' # String | The [Network id](#operation/list-networks).

begin
  # Get a private network
  result = api_instance.get_network(network_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->get_network: #{e}"
end
```

#### Using the get_network_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetNetwork200Response>, Integer, Hash)> get_network_with_http_info(network_id)

```ruby
begin
  # Get a private network
  data, status_code, headers = api_instance.get_network_with_http_info(network_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetNetwork200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->get_network_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network_id** | **String** | The [Network id](#operation/list-networks). |  |

### Return type

[**GetNetwork200Response**](GetNetwork200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_networks

> <ListNetworks200Response> list_networks(opts)

List Private Networks

Get a list of all Private Networks in your account.<br><br>**Deprecated**: Use [List VPCs](#operation/list-vpcs) instead.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::PrivateNetworksApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Private Networks
  result = api_instance.list_networks(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->list_networks: #{e}"
end
```

#### Using the list_networks_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListNetworks200Response>, Integer, Hash)> list_networks_with_http_info(opts)

```ruby
begin
  # List Private Networks
  data, status_code, headers = api_instance.list_networks_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListNetworks200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->list_networks_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListNetworks200Response**](ListNetworks200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_network

> update_network(network_id, opts)

Update a Private Network

Update information for a Private Network.<br><br>**Deprecated**: Use [Update VPC](#operation/update-vpc) instead.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::PrivateNetworksApi.new
network_id = 'network_id_example' # String | The [Network id](#operation/list-networks).
opts = {
  update_network_request: VultRuby::UpdateNetworkRequest.new({description: 'description_example'}) # UpdateNetworkRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update a Private Network
  api_instance.update_network(network_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->update_network: #{e}"
end
```

#### Using the update_network_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_network_with_http_info(network_id, opts)

```ruby
begin
  # Update a Private Network
  data, status_code, headers = api_instance.update_network_with_http_info(network_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling PrivateNetworksApi->update_network_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network_id** | **String** | The [Network id](#operation/list-networks). |  |
| **update_network_request** | [**UpdateNetworkRequest**](UpdateNetworkRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

