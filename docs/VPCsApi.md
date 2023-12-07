# VultrRuby::VPCsApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_vpc**](VPCsApi.md#create_vpc) | **POST** /vpcs | Create a VPC |
| [**delete_vpc**](VPCsApi.md#delete_vpc) | **DELETE** /vpcs/{vpc-id} | Delete a VPC |
| [**get_vpc**](VPCsApi.md#get_vpc) | **GET** /vpcs/{vpc-id} | Get a VPC |
| [**list_vpcs**](VPCsApi.md#list_vpcs) | **GET** /vpcs | List VPCs |
| [**update_vpc**](VPCsApi.md#update_vpc) | **PUT** /vpcs/{vpc-id} | Update a VPC |


## create_vpc

> <GetVpc200Response> create_vpc(opts)

Create a VPC

Create a new VPC in a `region`. VPCs should use [RFC1918 private address space](https://tools.ietf.org/html/rfc1918):      10.0.0.0    - 10.255.255.255  (10/8 prefix)     172.16.0.0  - 172.31.255.255  (172.16/12 prefix)     192.168.0.0 - 192.168.255.255 (192.168/16 prefix) 

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::VPCsApi.new
opts = {
  create_vpc_request: VultrRuby::CreateVpcRequest.new({region: 'region_example'}) # CreateVpcRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create a VPC
  result = api_instance.create_vpc(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->create_vpc: #{e}"
end
```

#### Using the create_vpc_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVpc200Response>, Integer, Hash)> create_vpc_with_http_info(opts)

```ruby
begin
  # Create a VPC
  data, status_code, headers = api_instance.create_vpc_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVpc200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->create_vpc_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_vpc_request** | [**CreateVpcRequest**](CreateVpcRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetVpc200Response**](GetVpc200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_vpc

> delete_vpc(vpc_id)

Delete a VPC

Delete a VPC.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::VPCsApi.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).

begin
  # Delete a VPC
  api_instance.delete_vpc(vpc_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->delete_vpc: #{e}"
end
```

#### Using the delete_vpc_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_vpc_with_http_info(vpc_id)

```ruby
begin
  # Delete a VPC
  data, status_code, headers = api_instance.delete_vpc_with_http_info(vpc_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->delete_vpc_with_http_info: #{e}"
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


## get_vpc

> <GetVpc200Response> get_vpc(vpc_id)

Get a VPC

Get information about a VPC.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::VPCsApi.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).

begin
  # Get a VPC
  result = api_instance.get_vpc(vpc_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->get_vpc: #{e}"
end
```

#### Using the get_vpc_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVpc200Response>, Integer, Hash)> get_vpc_with_http_info(vpc_id)

```ruby
begin
  # Get a VPC
  data, status_code, headers = api_instance.get_vpc_with_http_info(vpc_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVpc200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->get_vpc_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |

### Return type

[**GetVpc200Response**](GetVpc200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vpcs

> <ListVpcs200Response> list_vpcs(opts)

List VPCs

Get a list of all VPCs in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::VPCsApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List VPCs
  result = api_instance.list_vpcs(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->list_vpcs: #{e}"
end
```

#### Using the list_vpcs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListVpcs200Response>, Integer, Hash)> list_vpcs_with_http_info(opts)

```ruby
begin
  # List VPCs
  data, status_code, headers = api_instance.list_vpcs_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListVpcs200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->list_vpcs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListVpcs200Response**](ListVpcs200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_vpc

> update_vpc(vpc_id, opts)

Update a VPC

Update information for a VPC.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::VPCsApi.new
vpc_id = 'vpc_id_example' # String | The [VPC ID](#operation/list-vpcs).
opts = {
  update_vpc_request: VultrRuby::UpdateVpcRequest.new({description: 'description_example'}) # UpdateVpcRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update a VPC
  api_instance.update_vpc(vpc_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->update_vpc: #{e}"
end
```

#### Using the update_vpc_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_vpc_with_http_info(vpc_id, opts)

```ruby
begin
  # Update a VPC
  data, status_code, headers = api_instance.update_vpc_with_http_info(vpc_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling VPCsApi->update_vpc_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs). |  |
| **update_vpc_request** | [**UpdateVpcRequest**](UpdateVpcRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

