# VultrRuby::FirewallApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_firewall_group**](FirewallApi.md#create_firewall_group) | **POST** /firewalls | Create Firewall Group |
| [**delete_firewall_group**](FirewallApi.md#delete_firewall_group) | **DELETE** /firewalls/{firewall-group-id} | Delete Firewall Group |
| [**delete_firewall_group_rule**](FirewallApi.md#delete_firewall_group_rule) | **DELETE** /firewalls/{firewall-group-id}/rules/{firewall-rule-id} | Delete Firewall Rule |
| [**get_firewall_group**](FirewallApi.md#get_firewall_group) | **GET** /firewalls/{firewall-group-id} | Get Firewall Group |
| [**get_firewall_group_rule**](FirewallApi.md#get_firewall_group_rule) | **GET** /firewalls/{firewall-group-id}/rules/{firewall-rule-id} | Get Firewall Rule |
| [**list_firewall_group_rules**](FirewallApi.md#list_firewall_group_rules) | **GET** /firewalls/{firewall-group-id}/rules | List Firewall Rules |
| [**list_firewall_groups**](FirewallApi.md#list_firewall_groups) | **GET** /firewalls | List Firewall Groups |
| [**post_firewalls_firewall_group_id_rules**](FirewallApi.md#post_firewalls_firewall_group_id_rules) | **POST** /firewalls/{firewall-group-id}/rules | Create Firewall Rules |
| [**update_firewall_group**](FirewallApi.md#update_firewall_group) | **PUT** /firewalls/{firewall-group-id} | Update Firewall Group |


## create_firewall_group

> <CreateFirewallGroup201Response> create_firewall_group(opts)

Create Firewall Group

Create a new Firewall Group.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
opts = {
  create_firewall_group_request: VultrRuby::CreateFirewallGroupRequest.new # CreateFirewallGroupRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Firewall Group
  result = api_instance.create_firewall_group(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->create_firewall_group: #{e}"
end
```

#### Using the create_firewall_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateFirewallGroup201Response>, Integer, Hash)> create_firewall_group_with_http_info(opts)

```ruby
begin
  # Create Firewall Group
  data, status_code, headers = api_instance.create_firewall_group_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateFirewallGroup201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->create_firewall_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_firewall_group_request** | [**CreateFirewallGroupRequest**](CreateFirewallGroupRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateFirewallGroup201Response**](CreateFirewallGroup201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_firewall_group

> delete_firewall_group(firewall_group_id)

Delete Firewall Group

Delete a Firewall Group.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).

begin
  # Delete Firewall Group
  api_instance.delete_firewall_group(firewall_group_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->delete_firewall_group: #{e}"
end
```

#### Using the delete_firewall_group_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_firewall_group_with_http_info(firewall_group_id)

```ruby
begin
  # Delete Firewall Group
  data, status_code, headers = api_instance.delete_firewall_group_with_http_info(firewall_group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->delete_firewall_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_firewall_group_rule

> delete_firewall_group_rule(firewall_group_id, firewall_rule_id)

Delete Firewall Rule

Delete a Firewall Rule.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).
firewall_rule_id = 'firewall_rule_id_example' # String | The [Firewall Rule id](#operation/list-firewall-group-rules).

begin
  # Delete Firewall Rule
  api_instance.delete_firewall_group_rule(firewall_group_id, firewall_rule_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->delete_firewall_group_rule: #{e}"
end
```

#### Using the delete_firewall_group_rule_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_firewall_group_rule_with_http_info(firewall_group_id, firewall_rule_id)

```ruby
begin
  # Delete Firewall Rule
  data, status_code, headers = api_instance.delete_firewall_group_rule_with_http_info(firewall_group_id, firewall_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->delete_firewall_group_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |
| **firewall_rule_id** | **String** | The [Firewall Rule id](#operation/list-firewall-group-rules). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_firewall_group

> <CreateFirewallGroup201Response> get_firewall_group(firewall_group_id)

Get Firewall Group

Get information for a Firewall Group.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).

begin
  # Get Firewall Group
  result = api_instance.get_firewall_group(firewall_group_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->get_firewall_group: #{e}"
end
```

#### Using the get_firewall_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateFirewallGroup201Response>, Integer, Hash)> get_firewall_group_with_http_info(firewall_group_id)

```ruby
begin
  # Get Firewall Group
  data, status_code, headers = api_instance.get_firewall_group_with_http_info(firewall_group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateFirewallGroup201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->get_firewall_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |

### Return type

[**CreateFirewallGroup201Response**](CreateFirewallGroup201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_firewall_group_rule

> <PostFirewallsFirewallGroupIdRules201Response> get_firewall_group_rule(firewall_group_id, firewall_rule_id)

Get Firewall Rule

Get a Firewall Rule.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).
firewall_rule_id = 'firewall_rule_id_example' # String | The [Firewall Rule id](#operation/list-firewall-group-rules).

begin
  # Get Firewall Rule
  result = api_instance.get_firewall_group_rule(firewall_group_id, firewall_rule_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->get_firewall_group_rule: #{e}"
end
```

#### Using the get_firewall_group_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PostFirewallsFirewallGroupIdRules201Response>, Integer, Hash)> get_firewall_group_rule_with_http_info(firewall_group_id, firewall_rule_id)

```ruby
begin
  # Get Firewall Rule
  data, status_code, headers = api_instance.get_firewall_group_rule_with_http_info(firewall_group_id, firewall_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PostFirewallsFirewallGroupIdRules201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->get_firewall_group_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |
| **firewall_rule_id** | **String** | The [Firewall Rule id](#operation/list-firewall-group-rules). |  |

### Return type

[**PostFirewallsFirewallGroupIdRules201Response**](PostFirewallsFirewallGroupIdRules201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_firewall_group_rules

> <ListFirewallGroupRules200Response> list_firewall_group_rules(firewall_group_id, opts)

List Firewall Rules

Get the Firewall Rules for a Firewall Group.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Firewall Rules
  result = api_instance.list_firewall_group_rules(firewall_group_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->list_firewall_group_rules: #{e}"
end
```

#### Using the list_firewall_group_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListFirewallGroupRules200Response>, Integer, Hash)> list_firewall_group_rules_with_http_info(firewall_group_id, opts)

```ruby
begin
  # List Firewall Rules
  data, status_code, headers = api_instance.list_firewall_group_rules_with_http_info(firewall_group_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListFirewallGroupRules200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->list_firewall_group_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListFirewallGroupRules200Response**](ListFirewallGroupRules200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_firewall_groups

> <ListFirewallGroups200Response> list_firewall_groups(opts)

List Firewall Groups

Get a list of all Firewall Groups.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Firewall Groups
  result = api_instance.list_firewall_groups(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->list_firewall_groups: #{e}"
end
```

#### Using the list_firewall_groups_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListFirewallGroups200Response>, Integer, Hash)> list_firewall_groups_with_http_info(opts)

```ruby
begin
  # List Firewall Groups
  data, status_code, headers = api_instance.list_firewall_groups_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListFirewallGroups200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->list_firewall_groups_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListFirewallGroups200Response**](ListFirewallGroups200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## post_firewalls_firewall_group_id_rules

> <PostFirewallsFirewallGroupIdRules201Response> post_firewalls_firewall_group_id_rules(firewall_group_id, opts)

Create Firewall Rules

Create a Firewall Rule for a Firewall Group. The attributes `ip_type`, `protocol`, `subnet`, and `subnet_size` are required.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).
opts = {
  post_firewalls_firewall_group_id_rules_request: VultrRuby::PostFirewallsFirewallGroupIdRulesRequest.new({ip_type: 'ip_type_example', protocol: 'protocol_example', subnet: 'subnet_example', subnet_size: 37}) # PostFirewallsFirewallGroupIdRulesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Firewall Rules
  result = api_instance.post_firewalls_firewall_group_id_rules(firewall_group_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->post_firewalls_firewall_group_id_rules: #{e}"
end
```

#### Using the post_firewalls_firewall_group_id_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PostFirewallsFirewallGroupIdRules201Response>, Integer, Hash)> post_firewalls_firewall_group_id_rules_with_http_info(firewall_group_id, opts)

```ruby
begin
  # Create Firewall Rules
  data, status_code, headers = api_instance.post_firewalls_firewall_group_id_rules_with_http_info(firewall_group_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PostFirewallsFirewallGroupIdRules201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->post_firewalls_firewall_group_id_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |
| **post_firewalls_firewall_group_id_rules_request** | [**PostFirewallsFirewallGroupIdRulesRequest**](PostFirewallsFirewallGroupIdRulesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**PostFirewallsFirewallGroupIdRules201Response**](PostFirewallsFirewallGroupIdRules201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_firewall_group

> update_firewall_group(firewall_group_id, opts)

Update Firewall Group

Update information for a Firewall Group.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::FirewallApi.new
firewall_group_id = 'firewall_group_id_example' # String | The [Firewall Group id](#operation/list-firewall-groups).
opts = {
  update_firewall_group_request: VultrRuby::UpdateFirewallGroupRequest.new({description: 'description_example'}) # UpdateFirewallGroupRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Firewall Group
  api_instance.update_firewall_group(firewall_group_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->update_firewall_group: #{e}"
end
```

#### Using the update_firewall_group_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_firewall_group_with_http_info(firewall_group_id, opts)

```ruby
begin
  # Update Firewall Group
  data, status_code, headers = api_instance.update_firewall_group_with_http_info(firewall_group_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling FirewallApi->update_firewall_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups). |  |
| **update_firewall_group_request** | [**UpdateFirewallGroupRequest**](UpdateFirewallGroupRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

