# VultRuby::ReservedIpApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**attach_reserved_ip**](ReservedIpApi.md#attach_reserved_ip) | **POST** /reserved-ips/{reserved-ip}/attach | Attach Reserved IP |
| [**convert_reserved_ip**](ReservedIpApi.md#convert_reserved_ip) | **POST** /reserved-ips/convert | Convert Instance IP to Reserved IP |
| [**create_reserved_ip**](ReservedIpApi.md#create_reserved_ip) | **POST** /reserved-ips | Create Reserved IP |
| [**delete_reserved_ip**](ReservedIpApi.md#delete_reserved_ip) | **DELETE** /reserved-ips/{reserved-ip} | Delete Reserved IP |
| [**detach_reserved_ip**](ReservedIpApi.md#detach_reserved_ip) | **POST** /reserved-ips/{reserved-ip}/detach | Detach Reserved IP |
| [**get_reserved_ip**](ReservedIpApi.md#get_reserved_ip) | **GET** /reserved-ips/{reserved-ip} | Get Reserved IP |
| [**list_reserved_ips**](ReservedIpApi.md#list_reserved_ips) | **GET** /reserved-ips | List Reserved IPs |
| [**patch_reserved_ips_reserved_ip**](ReservedIpApi.md#patch_reserved_ips_reserved_ip) | **PATCH** /reserved-ips/{reserved-ip} | Update Reserved IP |


## attach_reserved_ip

> attach_reserved_ip(reserved_ip, opts)

Attach Reserved IP

Attach a Reserved IP to an compute instance or a baremetal instance - `instance_id`.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
reserved_ip = 'reserved_ip_example' # String | The [Reserved IP id](#operation/list-reserved-ips)
opts = {
  attach_reserved_ip_request: VultRuby::AttachReservedIpRequest.new({instance_id: 'instance_id_example'}) # AttachReservedIpRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach Reserved IP
  api_instance.attach_reserved_ip(reserved_ip, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->attach_reserved_ip: #{e}"
end
```

#### Using the attach_reserved_ip_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_reserved_ip_with_http_info(reserved_ip, opts)

```ruby
begin
  # Attach Reserved IP
  data, status_code, headers = api_instance.attach_reserved_ip_with_http_info(reserved_ip, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->attach_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reserved_ip** | **String** | The [Reserved IP id](#operation/list-reserved-ips) |  |
| **attach_reserved_ip_request** | [**AttachReservedIpRequest**](AttachReservedIpRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## convert_reserved_ip

> <GetReservedIp200Response> convert_reserved_ip(opts)

Convert Instance IP to Reserved IP

Convert the `ip_address` of an existing [instance](#operation/list-instances) into a Reserved IP.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
opts = {
  convert_reserved_ip_request: VultRuby::ConvertReservedIpRequest.new({ip_address: 'ip_address_example'}) # ConvertReservedIpRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Convert Instance IP to Reserved IP
  result = api_instance.convert_reserved_ip(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->convert_reserved_ip: #{e}"
end
```

#### Using the convert_reserved_ip_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetReservedIp200Response>, Integer, Hash)> convert_reserved_ip_with_http_info(opts)

```ruby
begin
  # Convert Instance IP to Reserved IP
  data, status_code, headers = api_instance.convert_reserved_ip_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetReservedIp200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->convert_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **convert_reserved_ip_request** | [**ConvertReservedIpRequest**](ConvertReservedIpRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetReservedIp200Response**](GetReservedIp200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_reserved_ip

> <GetReservedIp200Response> create_reserved_ip(opts)

Create Reserved IP

Create a new Reserved IP. The `region` and `ip_type` attributes are required.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
opts = {
  create_reserved_ip_request: VultRuby::CreateReservedIpRequest.new({region: 'region_example', ip_type: 'ip_type_example'}) # CreateReservedIpRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Reserved IP
  result = api_instance.create_reserved_ip(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->create_reserved_ip: #{e}"
end
```

#### Using the create_reserved_ip_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetReservedIp200Response>, Integer, Hash)> create_reserved_ip_with_http_info(opts)

```ruby
begin
  # Create Reserved IP
  data, status_code, headers = api_instance.create_reserved_ip_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetReservedIp200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->create_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_reserved_ip_request** | [**CreateReservedIpRequest**](CreateReservedIpRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetReservedIp200Response**](GetReservedIp200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_reserved_ip

> delete_reserved_ip(reserved_ip)

Delete Reserved IP

Delete a Reserved IP.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
reserved_ip = 'reserved_ip_example' # String | The [Reserved IP id](#operation/list-reserved-ips).

begin
  # Delete Reserved IP
  api_instance.delete_reserved_ip(reserved_ip)
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->delete_reserved_ip: #{e}"
end
```

#### Using the delete_reserved_ip_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_reserved_ip_with_http_info(reserved_ip)

```ruby
begin
  # Delete Reserved IP
  data, status_code, headers = api_instance.delete_reserved_ip_with_http_info(reserved_ip)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->delete_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reserved_ip** | **String** | The [Reserved IP id](#operation/list-reserved-ips). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## detach_reserved_ip

> detach_reserved_ip(reserved_ip)

Detach Reserved IP

Detach a Reserved IP.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
reserved_ip = 'reserved_ip_example' # String | The [Reserved IP id](#operation/list-reserved-ips)

begin
  # Detach Reserved IP
  api_instance.detach_reserved_ip(reserved_ip)
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->detach_reserved_ip: #{e}"
end
```

#### Using the detach_reserved_ip_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_reserved_ip_with_http_info(reserved_ip)

```ruby
begin
  # Detach Reserved IP
  data, status_code, headers = api_instance.detach_reserved_ip_with_http_info(reserved_ip)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->detach_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reserved_ip** | **String** | The [Reserved IP id](#operation/list-reserved-ips) |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_reserved_ip

> <GetReservedIp200Response> get_reserved_ip(reserved_ip)

Get Reserved IP

Get information about a Reserved IP.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
reserved_ip = 'reserved_ip_example' # String | The [Reserved IP id](#operation/list-reserved-ips).

begin
  # Get Reserved IP
  result = api_instance.get_reserved_ip(reserved_ip)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->get_reserved_ip: #{e}"
end
```

#### Using the get_reserved_ip_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetReservedIp200Response>, Integer, Hash)> get_reserved_ip_with_http_info(reserved_ip)

```ruby
begin
  # Get Reserved IP
  data, status_code, headers = api_instance.get_reserved_ip_with_http_info(reserved_ip)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetReservedIp200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->get_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reserved_ip** | **String** | The [Reserved IP id](#operation/list-reserved-ips). |  |

### Return type

[**GetReservedIp200Response**](GetReservedIp200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_reserved_ips

> <ListReservedIps200Response> list_reserved_ips(opts)

List Reserved IPs

List all Reserved IPs in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Reserved IPs
  result = api_instance.list_reserved_ips(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->list_reserved_ips: #{e}"
end
```

#### Using the list_reserved_ips_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListReservedIps200Response>, Integer, Hash)> list_reserved_ips_with_http_info(opts)

```ruby
begin
  # List Reserved IPs
  data, status_code, headers = api_instance.list_reserved_ips_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListReservedIps200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->list_reserved_ips_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListReservedIps200Response**](ListReservedIps200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_reserved_ips_reserved_ip

> <GetReservedIp200Response> patch_reserved_ips_reserved_ip(reserved_ip, opts)

Update Reserved IP

Update information on a Reserved IP.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ReservedIpApi.new
reserved_ip = 'reserved_ip_example' # String | The [Reserved IP id](#operation/list-reserved-ips).
opts = {
  patch_reserved_ips_reserved_ip_request: VultRuby::PatchReservedIpsReservedIpRequest.new({label: 'label_example'}) # PatchReservedIpsReservedIpRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Reserved IP
  result = api_instance.patch_reserved_ips_reserved_ip(reserved_ip, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->patch_reserved_ips_reserved_ip: #{e}"
end
```

#### Using the patch_reserved_ips_reserved_ip_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetReservedIp200Response>, Integer, Hash)> patch_reserved_ips_reserved_ip_with_http_info(reserved_ip, opts)

```ruby
begin
  # Update Reserved IP
  data, status_code, headers = api_instance.patch_reserved_ips_reserved_ip_with_http_info(reserved_ip, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetReservedIp200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ReservedIpApi->patch_reserved_ips_reserved_ip_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reserved_ip** | **String** | The [Reserved IP id](#operation/list-reserved-ips). |  |
| **patch_reserved_ips_reserved_ip_request** | [**PatchReservedIpsReservedIpRequest**](PatchReservedIpsReservedIpRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetReservedIp200Response**](GetReservedIp200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

