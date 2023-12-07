# VultRuby::VPC2Api

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**attach_vpc2_nodes**](VPC2Api.md#attach_vpc2_nodes) | **POST** /vpc2/{vpc-id}/nodes/attach | Attach nodes to a VPC 2.0 network |
| [**create_vpc2**](VPC2Api.md#create_vpc2) | **POST** /vpc2 | Create a VPC 2.0 network |
| [**delete_vpc2**](VPC2Api.md#delete_vpc2) | **DELETE** /vpc2/{vpc-id} | Delete a VPC 2.0 network |
| [**detach_vpc2_nodes**](VPC2Api.md#detach_vpc2_nodes) | **POST** /vpc2/{vpc-id}/nodes/detach | Remove nodes from a VPC 2.0 network |
| [**get_vpc2**](VPC2Api.md#get_vpc2) | **GET** /vpc2/{vpc-id} | Get a VPC 2.0 network |
| [**list_vpc2**](VPC2Api.md#list_vpc2) | **GET** /vpc2 | List VPC 2.0 networks |
| [**list_vpc2_nodes**](VPC2Api.md#list_vpc2_nodes) | **GET** /vpc2/{vpc-id}/nodes | Get a list of nodes attached to a VPC 2.0 network |
| [**update_vpc2**](VPC2Api.md#update_vpc2) | **PUT** /vpc2/{vpc-id} | Update a VPC 2.0 network |


## attach_vpc2_nodes

> attach_vpc2_nodes(vpc_id, opts)

Attach nodes to a VPC 2.0 network

Attach nodes to a VPC 2.0 network.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).
opts = {
  attach_vpc2_nodes_request: VultRuby::AttachVpc2NodesRequest.new({nodes: 3.56}) # AttachVpc2NodesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach nodes to a VPC 2.0 network
  api_instance.attach_vpc2_nodes(vpc_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->attach_vpc2_nodes: #{e}"
end
```

#### Using the attach_vpc2_nodes_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_vpc2_nodes_with_http_info(vpc_id, opts)

```ruby
begin
  # Attach nodes to a VPC 2.0 network
  data, status_code, headers = api_instance.attach_vpc2_nodes_with_http_info(vpc_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->attach_vpc2_nodes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |
| **attach_vpc2_nodes_request** | [**AttachVpc2NodesRequest**](AttachVpc2NodesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_vpc2

> <GetVpc2200Response> create_vpc2(opts)

Create a VPC 2.0 network

Create a new VPC 2.0 network in a `region`. VPCs should use [RFC1918 private address space](https://tools.ietf.org/html/rfc1918):      10.0.0.0    - 10.255.255.255  (10/8 prefix)     172.16.0.0  - 172.31.255.255  (172.16/12 prefix)     192.168.0.0 - 192.168.255.255 (192.168/16 prefix) 

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
opts = {
  create_vpc2_request: VultRuby::CreateVpc2Request.new({region: 'region_example'}) # CreateVpc2Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create a VPC 2.0 network
  result = api_instance.create_vpc2(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->create_vpc2: #{e}"
end
```

#### Using the create_vpc2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVpc2200Response>, Integer, Hash)> create_vpc2_with_http_info(opts)

```ruby
begin
  # Create a VPC 2.0 network
  data, status_code, headers = api_instance.create_vpc2_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVpc2200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->create_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_vpc2_request** | [**CreateVpc2Request**](CreateVpc2Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetVpc2200Response**](GetVpc2200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_vpc2

> delete_vpc2(vpc_id)

Delete a VPC 2.0 network

Delete a VPC 2.0 network.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).

begin
  # Delete a VPC 2.0 network
  api_instance.delete_vpc2(vpc_id)
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->delete_vpc2: #{e}"
end
```

#### Using the delete_vpc2_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_vpc2_with_http_info(vpc_id)

```ruby
begin
  # Delete a VPC 2.0 network
  data, status_code, headers = api_instance.delete_vpc2_with_http_info(vpc_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->delete_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## detach_vpc2_nodes

> detach_vpc2_nodes(vpc_id, opts)

Remove nodes from a VPC 2.0 network

Remove nodes from a VPC 2.0 network.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).
opts = {
  detach_vpc2_nodes_request: VultRuby::DetachVpc2NodesRequest.new({nodes: 3.56}) # DetachVpc2NodesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Remove nodes from a VPC 2.0 network
  api_instance.detach_vpc2_nodes(vpc_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->detach_vpc2_nodes: #{e}"
end
```

#### Using the detach_vpc2_nodes_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_vpc2_nodes_with_http_info(vpc_id, opts)

```ruby
begin
  # Remove nodes from a VPC 2.0 network
  data, status_code, headers = api_instance.detach_vpc2_nodes_with_http_info(vpc_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->detach_vpc2_nodes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |
| **detach_vpc2_nodes_request** | [**DetachVpc2NodesRequest**](DetachVpc2NodesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## get_vpc2

> <GetVpc2200Response> get_vpc2(vpc_id)

Get a VPC 2.0 network

Get information about a VPC 2.0 network.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).

begin
  # Get a VPC 2.0 network
  result = api_instance.get_vpc2(vpc_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->get_vpc2: #{e}"
end
```

#### Using the get_vpc2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVpc2200Response>, Integer, Hash)> get_vpc2_with_http_info(vpc_id)

```ruby
begin
  # Get a VPC 2.0 network
  data, status_code, headers = api_instance.get_vpc2_with_http_info(vpc_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVpc2200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->get_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |

### Return type

[**GetVpc2200Response**](GetVpc2200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vpc2

> <ListVpc2200Response> list_vpc2(opts)

List VPC 2.0 networks

Get a list of all VPC 2.0 networks in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List VPC 2.0 networks
  result = api_instance.list_vpc2(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->list_vpc2: #{e}"
end
```

#### Using the list_vpc2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListVpc2200Response>, Integer, Hash)> list_vpc2_with_http_info(opts)

```ruby
begin
  # List VPC 2.0 networks
  data, status_code, headers = api_instance.list_vpc2_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListVpc2200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->list_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListVpc2200Response**](ListVpc2200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vpc2_nodes

> <GetVpc2200Response> list_vpc2_nodes(vpc_id, opts)

Get a list of nodes attached to a VPC 2.0 network

Get a list of nodes attached to a VPC 2.0 network.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # Get a list of nodes attached to a VPC 2.0 network
  result = api_instance.list_vpc2_nodes(vpc_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->list_vpc2_nodes: #{e}"
end
```

#### Using the list_vpc2_nodes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVpc2200Response>, Integer, Hash)> list_vpc2_nodes_with_http_info(vpc_id, opts)

```ruby
begin
  # Get a list of nodes attached to a VPC 2.0 network
  data, status_code, headers = api_instance.list_vpc2_nodes_with_http_info(vpc_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVpc2200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->list_vpc2_nodes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**GetVpc2200Response**](GetVpc2200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_vpc2

> update_vpc2(vpc_id, opts)

Update a VPC 2.0 network

Update information for a VPC 2.0 network.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::VPC2Api.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).
opts = {
  update_vpc2_request: VultRuby::UpdateVpc2Request.new({description: 'description_example'}) # UpdateVpc2Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update a VPC 2.0 network
  api_instance.update_vpc2(vpc_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->update_vpc2: #{e}"
end
```

#### Using the update_vpc2_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_vpc2_with_http_info(vpc_id, opts)

```ruby
begin
  # Update a VPC 2.0 network
  data, status_code, headers = api_instance.update_vpc2_with_http_info(vpc_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling VPC2Api->update_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |
| **update_vpc2_request** | [**UpdateVpc2Request**](UpdateVpc2Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

