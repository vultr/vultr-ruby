# VultRuby::UsersApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_user**](UsersApi.md#create_user) | **POST** /users | Create User |
| [**delete_user**](UsersApi.md#delete_user) | **DELETE** /users/{user-id} | Delete User |
| [**get_user**](UsersApi.md#get_user) | **GET** /users/{user-id} | Get User |
| [**list_users**](UsersApi.md#list_users) | **GET** /users | Get Users |
| [**update_user**](UsersApi.md#update_user) | **PATCH** /users/{user-id} | Update User |


## create_user

> <User> create_user(opts)

Create User

Create a new User. The `email`, `name`, and `password` attributes are required.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::UsersApi.new
opts = {
  create_user_request: VultRuby::CreateUserRequest.new({email: 'email_example', name: 'name_example', password: 'password_example'}) # CreateUserRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create User
  result = api_instance.create_user(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->create_user: #{e}"
end
```

#### Using the create_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<User>, Integer, Hash)> create_user_with_http_info(opts)

```ruby
begin
  # Create User
  data, status_code, headers = api_instance.create_user_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <User>
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->create_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_user_request** | [**CreateUserRequest**](CreateUserRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**User**](User.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_user

> delete_user(user_id)

Delete User

Delete a User.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::UsersApi.new
user_id = 'user_id_example' # String | The [User id](#operation/list-users).

begin
  # Delete User
  api_instance.delete_user(user_id)
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->delete_user: #{e}"
end
```

#### Using the delete_user_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_user_with_http_info(user_id)

```ruby
begin
  # Delete User
  data, status_code, headers = api_instance.delete_user_with_http_info(user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->delete_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | The [User id](#operation/list-users). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_user

> <User> get_user(user_id)

Get User

Get information about a User.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::UsersApi.new
user_id = 'user_id_example' # String | The [User id](#operation/list-users).

begin
  # Get User
  result = api_instance.get_user(user_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->get_user: #{e}"
end
```

#### Using the get_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<User>, Integer, Hash)> get_user_with_http_info(user_id)

```ruby
begin
  # Get User
  data, status_code, headers = api_instance.get_user_with_http_info(user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <User>
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->get_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | The [User id](#operation/list-users). |  |

### Return type

[**User**](User.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_users

> <ListUsers200Response> list_users(opts)

Get Users

Get a list of all Users in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::UsersApi.new
opts = {
  per_page: 8.14, # Float | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # Get Users
  result = api_instance.list_users(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->list_users: #{e}"
end
```

#### Using the list_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListUsers200Response>, Integer, Hash)> list_users_with_http_info(opts)

```ruby
begin
  # Get Users
  data, status_code, headers = api_instance.list_users_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListUsers200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->list_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Float** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListUsers200Response**](ListUsers200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_user

> update_user(user_id, opts)

Update User

Update information for a User. All attributes are optional. If not set, the attributes will retain their original values.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::UsersApi.new
user_id = 'user_id_example' # String | The [User id](#operation/list-users).
opts = {
  update_user_request: VultRuby::UpdateUserRequest.new # UpdateUserRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update User
  api_instance.update_user(user_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->update_user: #{e}"
end
```

#### Using the update_user_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_user_with_http_info(user_id, opts)

```ruby
begin
  # Update User
  data, status_code, headers = api_instance.update_user_with_http_info(user_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling UsersApi->update_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | The [User id](#operation/list-users). |  |
| **update_user_request** | [**UpdateUserRequest**](UpdateUserRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

