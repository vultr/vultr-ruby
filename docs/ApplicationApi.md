# VultrRuby::ApplicationApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_applications**](ApplicationApi.md#list_applications) | **GET** /applications | List Applications |


## list_applications

> <ListApplications200Response> list_applications(opts)

List Applications

Get a list of all available Applications.

### Examples

```ruby
require 'time'
require 'vultr_ruby'

api_instance = VultrRuby::ApplicationApi.new
opts = {
  type: 'type_example', # String | Filter the results by type.  |   | Type | Description | | - | ------ | ------------- | |   | all | All available application types | |   | marketplace | Marketplace applications | |   | one-click | Vultr One-Click applications |
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Applications
  result = api_instance.list_applications(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ApplicationApi->list_applications: #{e}"
end
```

#### Using the list_applications_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListApplications200Response>, Integer, Hash)> list_applications_with_http_info(opts)

```ruby
begin
  # List Applications
  data, status_code, headers = api_instance.list_applications_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListApplications200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ApplicationApi->list_applications_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Filter the results by type.  |   | Type | Description | | - | ------ | ------------- | |   | all | All available application types | |   | marketplace | Marketplace applications | |   | one-click | Vultr One-Click applications | | [optional] |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListApplications200Response**](ListApplications200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

