# VultRuby::OsApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_os**](OsApi.md#list_os) | **GET** /os | List OS |


## list_os

> <ListOs200Response> list_os(opts)

List OS

List the OS images available for installation at Vultr.

### Examples

```ruby
require 'time'
require 'vult_ruby'

api_instance = VultRuby::OsApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500. 
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List OS
  result = api_instance.list_os(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling OsApi->list_os: #{e}"
end
```

#### Using the list_os_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListOs200Response>, Integer, Hash)> list_os_with_http_info(opts)

```ruby
begin
  # List OS
  data, status_code, headers = api_instance.list_os_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListOs200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling OsApi->list_os_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500.  | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListOs200Response**](ListOs200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

