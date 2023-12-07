# VultrRuby::BackupApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_backup**](BackupApi.md#get_backup) | **GET** /backups/{backup-id} | Get a Backup |
| [**list_backups**](BackupApi.md#list_backups) | **GET** /backups | List Backups |


## get_backup

> <GetBackup200Response> get_backup(backup_id)

Get a Backup

Get the information for the Backup.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BackupApi.new
backup_id = 'backup_id_example' # String | The [Backup id](#operation/list-backups).

begin
  # Get a Backup
  result = api_instance.get_backup(backup_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BackupApi->get_backup: #{e}"
end
```

#### Using the get_backup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBackup200Response>, Integer, Hash)> get_backup_with_http_info(backup_id)

```ruby
begin
  # Get a Backup
  data, status_code, headers = api_instance.get_backup_with_http_info(backup_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBackup200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BackupApi->get_backup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **backup_id** | **String** | The [Backup id](#operation/list-backups). |  |

### Return type

[**GetBackup200Response**](GetBackup200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_backups

> <ListBackups200Response> list_backups(opts)

List Backups

Get information about Backups in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BackupApi.new
opts = {
  instance_id: 'instance_id_example', # String | Filter the backup list by [Instance id](#operation/list-instances).
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Backups
  result = api_instance.list_backups(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BackupApi->list_backups: #{e}"
end
```

#### Using the list_backups_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBackups200Response>, Integer, Hash)> list_backups_with_http_info(opts)

```ruby
begin
  # List Backups
  data, status_code, headers = api_instance.list_backups_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBackups200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BackupApi->list_backups_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | Filter the backup list by [Instance id](#operation/list-instances). | [optional] |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListBackups200Response**](ListBackups200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

