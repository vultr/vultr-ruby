# VultrRuby::ManagedDatabasesApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_connection_pool**](ManagedDatabasesApi.md#create_connection_pool) | **POST** /databases/{database-id}/connection-pools | Create Connection Pool |
| [**create_database**](ManagedDatabasesApi.md#create_database) | **POST** /databases | Create Managed Database |
| [**create_database_db**](ManagedDatabasesApi.md#create_database_db) | **POST** /databases/{database-id}/dbs | Create Logical Database |
| [**create_database_user**](ManagedDatabasesApi.md#create_database_user) | **POST** /databases/{database-id}/users | Create Database User |
| [**database_add_read_replica**](ManagedDatabasesApi.md#database_add_read_replica) | **POST** /databases/{database-id}/read-replica | Add Read-Only Replica |
| [**database_detach_migration**](ManagedDatabasesApi.md#database_detach_migration) | **DELETE** /databases/{database-id}/migration | Detach Migration |
| [**database_fork**](ManagedDatabasesApi.md#database_fork) | **POST** /databases/{database-id}/fork | Fork Managed Database |
| [**database_promote_read_replica**](ManagedDatabasesApi.md#database_promote_read_replica) | **POST** /databases/{database-id}/promote-read-replica | Promote Read-Only Replica |
| [**database_restore_from_backup**](ManagedDatabasesApi.md#database_restore_from_backup) | **POST** /databases/{database-id}/restore | Restore from Backup |
| [**database_start_migration**](ManagedDatabasesApi.md#database_start_migration) | **POST** /databases/{database-id}/migration | Start Migration |
| [**delete_connection_pool**](ManagedDatabasesApi.md#delete_connection_pool) | **DELETE** /databases/{database-id}/connection-pools/{pool-name} | Delete Connection Pool |
| [**delete_database**](ManagedDatabasesApi.md#delete_database) | **DELETE** /databases/{database-id} | Delete Managed Database |
| [**delete_database_db**](ManagedDatabasesApi.md#delete_database_db) | **DELETE** /databases/{database-id}/dbs/{db-name} | Delete Logical Database |
| [**delete_database_user**](ManagedDatabasesApi.md#delete_database_user) | **DELETE** /databases/{database-id}/users/{username} | Delete Database User |
| [**get_backup_information**](ManagedDatabasesApi.md#get_backup_information) | **GET** /databases/{database-id}/backups | Get Backup Information |
| [**get_connection_pool**](ManagedDatabasesApi.md#get_connection_pool) | **GET** /databases/{database-id}/connection-pools/{pool-name} | Get Connection Pool |
| [**get_database**](ManagedDatabasesApi.md#get_database) | **GET** /databases/{database-id} | Get Managed Database |
| [**get_database_db**](ManagedDatabasesApi.md#get_database_db) | **GET** /databases/{database-id}/dbs/{db-name} | Get Logical Database |
| [**get_database_usage**](ManagedDatabasesApi.md#get_database_usage) | **GET** /databases/{database-id}/usage | Get Database Usage Information |
| [**get_database_user**](ManagedDatabasesApi.md#get_database_user) | **GET** /databases/{database-id}/users/{username} | Get Database User |
| [**list_advanced_options**](ManagedDatabasesApi.md#list_advanced_options) | **GET** /databases/{database-id}/advanced-options | List Advanced Options |
| [**list_available_versions**](ManagedDatabasesApi.md#list_available_versions) | **GET** /databases/{database-id}/version-upgrade | List Available Versions |
| [**list_connection_pools**](ManagedDatabasesApi.md#list_connection_pools) | **GET** /databases/{database-id}/connection-pools | List Connection Pools |
| [**list_database_dbs**](ManagedDatabasesApi.md#list_database_dbs) | **GET** /databases/{database-id}/dbs | List Logical Databases |
| [**list_database_plans**](ManagedDatabasesApi.md#list_database_plans) | **GET** /databases/plans | List Managed Database Plans |
| [**list_database_users**](ManagedDatabasesApi.md#list_database_users) | **GET** /databases/{database-id}/users | List Database Users |
| [**list_databases**](ManagedDatabasesApi.md#list_databases) | **GET** /databases | List Managed Databases |
| [**list_maintenance_updates**](ManagedDatabasesApi.md#list_maintenance_updates) | **GET** /databases/{database-id}/maintenance | List Maintenance Updates |
| [**list_service_alerts**](ManagedDatabasesApi.md#list_service_alerts) | **POST** /databases/{database-id}/alerts | List Service Alerts |
| [**set_database_user_acl**](ManagedDatabasesApi.md#set_database_user_acl) | **PUT** /databases/{database-id}/users/{username}/access-control | Set Database User Access Control |
| [**start_maintenance_updates**](ManagedDatabasesApi.md#start_maintenance_updates) | **POST** /databases/{database-id}/maintenance | Start Maintenance Updates |
| [**start_version_upgrade**](ManagedDatabasesApi.md#start_version_upgrade) | **POST** /databases/{database-id}/version-upgrade | Start Version Upgrade |
| [**update_advanced_options**](ManagedDatabasesApi.md#update_advanced_options) | **PUT** /databases/{database-id}/advanced-options | Update Advanced Options |
| [**update_connection_pool**](ManagedDatabasesApi.md#update_connection_pool) | **PUT** /databases/{database-id}/connection-pools/{pool-name} | Update Connection Pool |
| [**update_database**](ManagedDatabasesApi.md#update_database) | **PUT** /databases/{database-id} | Update Managed Database |
| [**update_database_user**](ManagedDatabasesApi.md#update_database_user) | **PUT** /databases/{database-id}/users/{username} | Update Database User |
| [**view_migration_status**](ManagedDatabasesApi.md#view_migration_status) | **GET** /databases/{database-id}/migration | Get Migration Status |


## create_connection_pool

> <CreateConnectionPool202Response> create_connection_pool(opts)

Create Connection Pool

Create a new connection pool within the Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  create_connection_pool_request: VultrRuby::CreateConnectionPoolRequest.new({name: 'name_example', database: 'database_example', username: 'username_example', mode: 'mode_example', size: 37}) # CreateConnectionPoolRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Connection Pool
  result = api_instance.create_connection_pool(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_connection_pool: #{e}"
end
```

#### Using the create_connection_pool_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateConnectionPool202Response>, Integer, Hash)> create_connection_pool_with_http_info(opts)

```ruby
begin
  # Create Connection Pool
  data, status_code, headers = api_instance.create_connection_pool_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateConnectionPool202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_connection_pool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_connection_pool_request** | [**CreateConnectionPoolRequest**](CreateConnectionPoolRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateConnectionPool202Response**](CreateConnectionPool202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_database

> <CreateDatabase202Response> create_database(opts)

Create Managed Database

Create a new Managed Database in a `region` with the desired `plan`. Supply optional attributes as desired.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  create_database_request: VultrRuby::CreateDatabaseRequest.new({database_engine: 'database_engine_example', database_engine_version: 'database_engine_version_example', region: 'region_example', plan: 'plan_example', label: 'label_example'}) # CreateDatabaseRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Managed Database
  result = api_instance.create_database(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_database: #{e}"
end
```

#### Using the create_database_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabase202Response>, Integer, Hash)> create_database_with_http_info(opts)

```ruby
begin
  # Create Managed Database
  data, status_code, headers = api_instance.create_database_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabase202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_database_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_database_request** | [**CreateDatabaseRequest**](CreateDatabaseRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabase202Response**](CreateDatabase202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_database_db

> <CreateDatabaseDb202Response> create_database_db(opts)

Create Logical Database

Create a new logical database within the Managed Database (MySQL and PostgreSQL only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  create_database_db_request: VultrRuby::CreateDatabaseDbRequest.new({name: 'name_example'}) # CreateDatabaseDbRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Logical Database
  result = api_instance.create_database_db(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_database_db: #{e}"
end
```

#### Using the create_database_db_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabaseDb202Response>, Integer, Hash)> create_database_db_with_http_info(opts)

```ruby
begin
  # Create Logical Database
  data, status_code, headers = api_instance.create_database_db_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabaseDb202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_database_db_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_database_db_request** | [**CreateDatabaseDbRequest**](CreateDatabaseDbRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabaseDb202Response**](CreateDatabaseDb202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_database_user

> <CreateDatabaseUser202Response> create_database_user(opts)

Create Database User

Create a new database user within the Managed Database. Supply optional attributes as desired.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  create_database_user_request: VultrRuby::CreateDatabaseUserRequest.new({username: 'username_example'}) # CreateDatabaseUserRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Database User
  result = api_instance.create_database_user(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_database_user: #{e}"
end
```

#### Using the create_database_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabaseUser202Response>, Integer, Hash)> create_database_user_with_http_info(opts)

```ruby
begin
  # Create Database User
  data, status_code, headers = api_instance.create_database_user_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabaseUser202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->create_database_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_database_user_request** | [**CreateDatabaseUserRequest**](CreateDatabaseUserRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabaseUser202Response**](CreateDatabaseUser202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## database_add_read_replica

> <CreateDatabase202Response> database_add_read_replica(opts)

Add Read-Only Replica

Create a read-only replica node for the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  database_add_read_replica_request: VultrRuby::DatabaseAddReadReplicaRequest.new({region: 'region_example', label: 'label_example'}) # DatabaseAddReadReplicaRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Add Read-Only Replica
  result = api_instance.database_add_read_replica(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_add_read_replica: #{e}"
end
```

#### Using the database_add_read_replica_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabase202Response>, Integer, Hash)> database_add_read_replica_with_http_info(opts)

```ruby
begin
  # Add Read-Only Replica
  data, status_code, headers = api_instance.database_add_read_replica_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabase202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_add_read_replica_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_add_read_replica_request** | [**DatabaseAddReadReplicaRequest**](DatabaseAddReadReplicaRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabase202Response**](CreateDatabase202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## database_detach_migration

> database_detach_migration

Detach Migration

Detach a migration from the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # Detach Migration
  api_instance.database_detach_migration
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_detach_migration: #{e}"
end
```

#### Using the database_detach_migration_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> database_detach_migration_with_http_info

```ruby
begin
  # Detach Migration
  data, status_code, headers = api_instance.database_detach_migration_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_detach_migration_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## database_fork

> <CreateDatabase202Response> database_fork(opts)

Fork Managed Database

Fork a Managed Database to a new subscription from a backup.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  database_fork_request: VultrRuby::DatabaseForkRequest.new({label: 'label_example', region: 'region_example', plan: 'plan_example'}) # DatabaseForkRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Fork Managed Database
  result = api_instance.database_fork(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_fork: #{e}"
end
```

#### Using the database_fork_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabase202Response>, Integer, Hash)> database_fork_with_http_info(opts)

```ruby
begin
  # Fork Managed Database
  data, status_code, headers = api_instance.database_fork_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabase202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_fork_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_fork_request** | [**DatabaseForkRequest**](DatabaseForkRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabase202Response**](CreateDatabase202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## database_promote_read_replica

> database_promote_read_replica

Promote Read-Only Replica

Promote a read-only replica node to its own primary Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # Promote Read-Only Replica
  api_instance.database_promote_read_replica
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_promote_read_replica: #{e}"
end
```

#### Using the database_promote_read_replica_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> database_promote_read_replica_with_http_info

```ruby
begin
  # Promote Read-Only Replica
  data, status_code, headers = api_instance.database_promote_read_replica_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_promote_read_replica_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## database_restore_from_backup

> <CreateDatabase202Response> database_restore_from_backup(opts)

Restore from Backup

Create a new Managed Database from a backup.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  database_restore_from_backup_request: VultrRuby::DatabaseRestoreFromBackupRequest.new({label: 'label_example'}) # DatabaseRestoreFromBackupRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Restore from Backup
  result = api_instance.database_restore_from_backup(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_restore_from_backup: #{e}"
end
```

#### Using the database_restore_from_backup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabase202Response>, Integer, Hash)> database_restore_from_backup_with_http_info(opts)

```ruby
begin
  # Restore from Backup
  data, status_code, headers = api_instance.database_restore_from_backup_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabase202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_restore_from_backup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_restore_from_backup_request** | [**DatabaseRestoreFromBackupRequest**](DatabaseRestoreFromBackupRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabase202Response**](CreateDatabase202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## database_start_migration

> <ViewMigrationStatus200Response> database_start_migration(opts)

Start Migration

Start a migration to the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  database_start_migration_request: VultrRuby::DatabaseStartMigrationRequest.new({host: 'host_example', port: 3.56, username: 'username_example', password: 'password_example', ssl: false}) # DatabaseStartMigrationRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Start Migration
  result = api_instance.database_start_migration(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_start_migration: #{e}"
end
```

#### Using the database_start_migration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ViewMigrationStatus200Response>, Integer, Hash)> database_start_migration_with_http_info(opts)

```ruby
begin
  # Start Migration
  data, status_code, headers = api_instance.database_start_migration_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ViewMigrationStatus200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->database_start_migration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_start_migration_request** | [**DatabaseStartMigrationRequest**](DatabaseStartMigrationRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**ViewMigrationStatus200Response**](ViewMigrationStatus200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_connection_pool

> delete_connection_pool(database_id, pool_name)

Delete Connection Pool

Delete a connection pool within a Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
pool_name = 'pool_name_example' # String | The [connection pool name](#operation/list-connection-pools).

begin
  # Delete Connection Pool
  api_instance.delete_connection_pool(database_id, pool_name)
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_connection_pool: #{e}"
end
```

#### Using the delete_connection_pool_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_connection_pool_with_http_info(database_id, pool_name)

```ruby
begin
  # Delete Connection Pool
  data, status_code, headers = api_instance.delete_connection_pool_with_http_info(database_id, pool_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_connection_pool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **pool_name** | **String** | The [connection pool name](#operation/list-connection-pools). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_database

> delete_database(database_id)

Delete Managed Database

Delete a Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).

begin
  # Delete Managed Database
  api_instance.delete_database(database_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_database: #{e}"
end
```

#### Using the delete_database_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_database_with_http_info(database_id)

```ruby
begin
  # Delete Managed Database
  data, status_code, headers = api_instance.delete_database_with_http_info(database_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_database_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_database_db

> delete_database_db(database_id, db_name)

Delete Logical Database

Delete a logical database within a Managed Database (MySQL and PostgreSQL only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
db_name = 'db_name_example' # String | The [logical database name](#operation/list-database-dbs).

begin
  # Delete Logical Database
  api_instance.delete_database_db(database_id, db_name)
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_database_db: #{e}"
end
```

#### Using the delete_database_db_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_database_db_with_http_info(database_id, db_name)

```ruby
begin
  # Delete Logical Database
  data, status_code, headers = api_instance.delete_database_db_with_http_info(database_id, db_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_database_db_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **db_name** | **String** | The [logical database name](#operation/list-database-dbs). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_database_user

> delete_database_user(database_id, username)

Delete Database User

Delete a database user within a Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
username = 'username_example' # String | The [database user](#operation/list-database-users).

begin
  # Delete Database User
  api_instance.delete_database_user(database_id, username)
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_database_user: #{e}"
end
```

#### Using the delete_database_user_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_database_user_with_http_info(database_id, username)

```ruby
begin
  # Delete Database User
  data, status_code, headers = api_instance.delete_database_user_with_http_info(database_id, username)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->delete_database_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **username** | **String** | The [database user](#operation/list-database-users). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_backup_information

> <GetBackupInformation200Response> get_backup_information

Get Backup Information

Get backup information for the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # Get Backup Information
  result = api_instance.get_backup_information
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_backup_information: #{e}"
end
```

#### Using the get_backup_information_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBackupInformation200Response>, Integer, Hash)> get_backup_information_with_http_info

```ruby
begin
  # Get Backup Information
  data, status_code, headers = api_instance.get_backup_information_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBackupInformation200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_backup_information_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetBackupInformation200Response**](GetBackupInformation200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_connection_pool

> <CreateConnectionPool202Response> get_connection_pool(database_id, pool_name)

Get Connection Pool

Get information about a Managed Database connection pool (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
pool_name = 'pool_name_example' # String | The [connection pool name](#operation/list-connection-pools).

begin
  # Get Connection Pool
  result = api_instance.get_connection_pool(database_id, pool_name)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_connection_pool: #{e}"
end
```

#### Using the get_connection_pool_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateConnectionPool202Response>, Integer, Hash)> get_connection_pool_with_http_info(database_id, pool_name)

```ruby
begin
  # Get Connection Pool
  data, status_code, headers = api_instance.get_connection_pool_with_http_info(database_id, pool_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateConnectionPool202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_connection_pool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **pool_name** | **String** | The [connection pool name](#operation/list-connection-pools). |  |

### Return type

[**CreateConnectionPool202Response**](CreateConnectionPool202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_database

> <CreateDatabase202Response> get_database(database_id)

Get Managed Database

Get information about a Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).

begin
  # Get Managed Database
  result = api_instance.get_database(database_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database: #{e}"
end
```

#### Using the get_database_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabase202Response>, Integer, Hash)> get_database_with_http_info(database_id)

```ruby
begin
  # Get Managed Database
  data, status_code, headers = api_instance.get_database_with_http_info(database_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabase202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |

### Return type

[**CreateDatabase202Response**](CreateDatabase202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_database_db

> <CreateDatabaseDb202Response> get_database_db(database_id, db_name)

Get Logical Database

Get information about a logical database within a Managed Database (MySQL and PostgreSQL only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
db_name = 'db_name_example' # String | The [logical database name](#operation/list-database-dbs).

begin
  # Get Logical Database
  result = api_instance.get_database_db(database_id, db_name)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_db: #{e}"
end
```

#### Using the get_database_db_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabaseDb202Response>, Integer, Hash)> get_database_db_with_http_info(database_id, db_name)

```ruby
begin
  # Get Logical Database
  data, status_code, headers = api_instance.get_database_db_with_http_info(database_id, db_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabaseDb202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_db_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **db_name** | **String** | The [logical database name](#operation/list-database-dbs). |  |

### Return type

[**CreateDatabaseDb202Response**](CreateDatabaseDb202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_database_usage

> <GetDatabaseUsage200Response> get_database_usage

Get Database Usage Information

Get disk, memory, and vCPU usage information for a Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # Get Database Usage Information
  result = api_instance.get_database_usage
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_usage: #{e}"
end
```

#### Using the get_database_usage_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetDatabaseUsage200Response>, Integer, Hash)> get_database_usage_with_http_info

```ruby
begin
  # Get Database Usage Information
  data, status_code, headers = api_instance.get_database_usage_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetDatabaseUsage200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_usage_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetDatabaseUsage200Response**](GetDatabaseUsage200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_database_user

> <CreateDatabaseUser202Response> get_database_user(database_id, username)

Get Database User

Get information about a Managed Database user.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
username = 'username_example' # String | The [database user](#operation/list-database-users).

begin
  # Get Database User
  result = api_instance.get_database_user(database_id, username)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_user: #{e}"
end
```

#### Using the get_database_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabaseUser202Response>, Integer, Hash)> get_database_user_with_http_info(database_id, username)

```ruby
begin
  # Get Database User
  data, status_code, headers = api_instance.get_database_user_with_http_info(database_id, username)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabaseUser202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->get_database_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **username** | **String** | The [database user](#operation/list-database-users). |  |

### Return type

[**CreateDatabaseUser202Response**](CreateDatabaseUser202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_advanced_options

> <ListAdvancedOptions200Response> list_advanced_options

List Advanced Options

List all configured and available advanced options for the Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # List Advanced Options
  result = api_instance.list_advanced_options
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_advanced_options: #{e}"
end
```

#### Using the list_advanced_options_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAdvancedOptions200Response>, Integer, Hash)> list_advanced_options_with_http_info

```ruby
begin
  # List Advanced Options
  data, status_code, headers = api_instance.list_advanced_options_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAdvancedOptions200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_advanced_options_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListAdvancedOptions200Response**](ListAdvancedOptions200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_available_versions

> <ListAvailableVersions200Response> list_available_versions

List Available Versions

List all available version upgrades within the Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # List Available Versions
  result = api_instance.list_available_versions
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_available_versions: #{e}"
end
```

#### Using the list_available_versions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAvailableVersions200Response>, Integer, Hash)> list_available_versions_with_http_info

```ruby
begin
  # List Available Versions
  data, status_code, headers = api_instance.list_available_versions_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAvailableVersions200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_available_versions_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListAvailableVersions200Response**](ListAvailableVersions200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_connection_pools

> <ListConnectionPools200Response> list_connection_pools

List Connection Pools

List all connection pools within the Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # List Connection Pools
  result = api_instance.list_connection_pools
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_connection_pools: #{e}"
end
```

#### Using the list_connection_pools_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListConnectionPools200Response>, Integer, Hash)> list_connection_pools_with_http_info

```ruby
begin
  # List Connection Pools
  data, status_code, headers = api_instance.list_connection_pools_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListConnectionPools200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_connection_pools_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListConnectionPools200Response**](ListConnectionPools200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_database_dbs

> <ListDatabaseDbs200Response> list_database_dbs

List Logical Databases

List all logical databases within the Managed Database (MySQL and PostgreSQL only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # List Logical Databases
  result = api_instance.list_database_dbs
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_database_dbs: #{e}"
end
```

#### Using the list_database_dbs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDatabaseDbs200Response>, Integer, Hash)> list_database_dbs_with_http_info

```ruby
begin
  # List Logical Databases
  data, status_code, headers = api_instance.list_database_dbs_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDatabaseDbs200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_database_dbs_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListDatabaseDbs200Response**](ListDatabaseDbs200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_database_plans

> <ListDatabasePlans200Response> list_database_plans(opts)

List Managed Database Plans

List all Managed Databases plans.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  engine: 'engine_example', # String | Filter by engine type  * `mysql` * `pg` * `redis`.
  nodes: 56, # Integer | Filter by number of nodes.
  region: 'region_example' # String | Filter by [Region id](#operation/list-regions).
}

begin
  # List Managed Database Plans
  result = api_instance.list_database_plans(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_database_plans: #{e}"
end
```

#### Using the list_database_plans_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDatabasePlans200Response>, Integer, Hash)> list_database_plans_with_http_info(opts)

```ruby
begin
  # List Managed Database Plans
  data, status_code, headers = api_instance.list_database_plans_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDatabasePlans200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_database_plans_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **engine** | **String** | Filter by engine type  * &#x60;mysql&#x60; * &#x60;pg&#x60; * &#x60;redis&#x60;. | [optional] |
| **nodes** | **Integer** | Filter by number of nodes. | [optional] |
| **region** | **String** | Filter by [Region id](#operation/list-regions). | [optional] |

### Return type

[**ListDatabasePlans200Response**](ListDatabasePlans200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_database_users

> <ListDatabaseUsers200Response> list_database_users

List Database Users

List all database users within the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # List Database Users
  result = api_instance.list_database_users
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_database_users: #{e}"
end
```

#### Using the list_database_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDatabaseUsers200Response>, Integer, Hash)> list_database_users_with_http_info

```ruby
begin
  # List Database Users
  data, status_code, headers = api_instance.list_database_users_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDatabaseUsers200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_database_users_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListDatabaseUsers200Response**](ListDatabaseUsers200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_databases

> <ListDatabases200Response> list_databases(opts)

List Managed Databases

List all Managed Databases in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  label: 'label_example', # String | Filter by label.
  tag: 'tag_example', # String | Filter by specific tag.
  region: 'region_example' # String | Filter by [Region id](#operation/list-regions).
}

begin
  # List Managed Databases
  result = api_instance.list_databases(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_databases: #{e}"
end
```

#### Using the list_databases_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDatabases200Response>, Integer, Hash)> list_databases_with_http_info(opts)

```ruby
begin
  # List Managed Databases
  data, status_code, headers = api_instance.list_databases_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDatabases200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_databases_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label** | **String** | Filter by label. | [optional] |
| **tag** | **String** | Filter by specific tag. | [optional] |
| **region** | **String** | Filter by [Region id](#operation/list-regions). | [optional] |

### Return type

[**ListDatabases200Response**](ListDatabases200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_maintenance_updates

> <ListMaintenanceUpdates200Response> list_maintenance_updates

List Maintenance Updates

List all available version upgrades within the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # List Maintenance Updates
  result = api_instance.list_maintenance_updates
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_maintenance_updates: #{e}"
end
```

#### Using the list_maintenance_updates_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListMaintenanceUpdates200Response>, Integer, Hash)> list_maintenance_updates_with_http_info

```ruby
begin
  # List Maintenance Updates
  data, status_code, headers = api_instance.list_maintenance_updates_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListMaintenanceUpdates200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_maintenance_updates_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListMaintenanceUpdates200Response**](ListMaintenanceUpdates200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_service_alerts

> <ListServiceAlerts200Response> list_service_alerts(opts)

List Service Alerts

List service alert messages for the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  list_service_alerts_request: VultrRuby::ListServiceAlertsRequest.new({period: 'period_example'}) # ListServiceAlertsRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # List Service Alerts
  result = api_instance.list_service_alerts(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_service_alerts: #{e}"
end
```

#### Using the list_service_alerts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListServiceAlerts200Response>, Integer, Hash)> list_service_alerts_with_http_info(opts)

```ruby
begin
  # List Service Alerts
  data, status_code, headers = api_instance.list_service_alerts_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListServiceAlerts200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->list_service_alerts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **list_service_alerts_request** | [**ListServiceAlertsRequest**](ListServiceAlertsRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**ListServiceAlerts200Response**](ListServiceAlerts200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## set_database_user_acl

> <CreateDatabaseUser202Response> set_database_user_acl(database_id, username, opts)

Set Database User Access Control

Configure access control settings for a Managed Database user (Redis engine type only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
username = 'username_example' # String | The [database user](#operation/list-database-users).
opts = {
  set_database_user_acl_request: VultrRuby::SetDatabaseUserAclRequest.new # SetDatabaseUserAclRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Set Database User Access Control
  result = api_instance.set_database_user_acl(database_id, username, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->set_database_user_acl: #{e}"
end
```

#### Using the set_database_user_acl_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabaseUser202Response>, Integer, Hash)> set_database_user_acl_with_http_info(database_id, username, opts)

```ruby
begin
  # Set Database User Access Control
  data, status_code, headers = api_instance.set_database_user_acl_with_http_info(database_id, username, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabaseUser202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->set_database_user_acl_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **username** | **String** | The [database user](#operation/list-database-users). |  |
| **set_database_user_acl_request** | [**SetDatabaseUserAclRequest**](SetDatabaseUserAclRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabaseUser202Response**](CreateDatabaseUser202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## start_maintenance_updates

> <StartMaintenanceUpdates200Response> start_maintenance_updates

Start Maintenance Updates

Start maintenance updates for the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # Start Maintenance Updates
  result = api_instance.start_maintenance_updates
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->start_maintenance_updates: #{e}"
end
```

#### Using the start_maintenance_updates_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StartMaintenanceUpdates200Response>, Integer, Hash)> start_maintenance_updates_with_http_info

```ruby
begin
  # Start Maintenance Updates
  data, status_code, headers = api_instance.start_maintenance_updates_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StartMaintenanceUpdates200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->start_maintenance_updates_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**StartMaintenanceUpdates200Response**](StartMaintenanceUpdates200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## start_version_upgrade

> <StartVersionUpgrade200Response> start_version_upgrade(opts)

Start Version Upgrade

Start a version upgrade for the Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  start_version_upgrade_request: VultrRuby::StartVersionUpgradeRequest.new({version: 'version_example'}) # StartVersionUpgradeRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Start Version Upgrade
  result = api_instance.start_version_upgrade(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->start_version_upgrade: #{e}"
end
```

#### Using the start_version_upgrade_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StartVersionUpgrade200Response>, Integer, Hash)> start_version_upgrade_with_http_info(opts)

```ruby
begin
  # Start Version Upgrade
  data, status_code, headers = api_instance.start_version_upgrade_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StartVersionUpgrade200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->start_version_upgrade_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_version_upgrade_request** | [**StartVersionUpgradeRequest**](StartVersionUpgradeRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**StartVersionUpgrade200Response**](StartVersionUpgrade200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_advanced_options

> <ListAdvancedOptions200Response> update_advanced_options(opts)

Update Advanced Options

Updates an advanced configuration option for the Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
opts = {
  update_advanced_options_request: VultrRuby::UpdateAdvancedOptionsRequest.new # UpdateAdvancedOptionsRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Advanced Options
  result = api_instance.update_advanced_options(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_advanced_options: #{e}"
end
```

#### Using the update_advanced_options_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAdvancedOptions200Response>, Integer, Hash)> update_advanced_options_with_http_info(opts)

```ruby
begin
  # Update Advanced Options
  data, status_code, headers = api_instance.update_advanced_options_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAdvancedOptions200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_advanced_options_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **update_advanced_options_request** | [**UpdateAdvancedOptionsRequest**](UpdateAdvancedOptionsRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**ListAdvancedOptions200Response**](ListAdvancedOptions200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_connection_pool

> <CreateConnectionPool202Response> update_connection_pool(database_id, pool_name, opts)

Update Connection Pool

Update connection-pool information within a Managed Database (PostgreSQL engine types only).

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
pool_name = 'pool_name_example' # String | The [connection pool name](#operation/list-connection-pools).
opts = {
  update_connection_pool_request: VultrRuby::UpdateConnectionPoolRequest.new # UpdateConnectionPoolRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Connection Pool
  result = api_instance.update_connection_pool(database_id, pool_name, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_connection_pool: #{e}"
end
```

#### Using the update_connection_pool_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateConnectionPool202Response>, Integer, Hash)> update_connection_pool_with_http_info(database_id, pool_name, opts)

```ruby
begin
  # Update Connection Pool
  data, status_code, headers = api_instance.update_connection_pool_with_http_info(database_id, pool_name, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateConnectionPool202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_connection_pool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **pool_name** | **String** | The [connection pool name](#operation/list-connection-pools). |  |
| **update_connection_pool_request** | [**UpdateConnectionPoolRequest**](UpdateConnectionPoolRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateConnectionPool202Response**](CreateConnectionPool202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_database

> <CreateDatabase202Response> update_database(database_id, opts)

Update Managed Database

Update information for a Managed Database. All attributes are optional. If not set, the attributes will retain their original values.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
opts = {
  update_database_request: VultrRuby::UpdateDatabaseRequest.new # UpdateDatabaseRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Managed Database
  result = api_instance.update_database(database_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_database: #{e}"
end
```

#### Using the update_database_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabase202Response>, Integer, Hash)> update_database_with_http_info(database_id, opts)

```ruby
begin
  # Update Managed Database
  data, status_code, headers = api_instance.update_database_with_http_info(database_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabase202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_database_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **update_database_request** | [**UpdateDatabaseRequest**](UpdateDatabaseRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabase202Response**](CreateDatabase202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_database_user

> <CreateDatabaseUser202Response> update_database_user(database_id, username, opts)

Update Database User

Update database user information within a Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new
database_id = 'database_id_example' # String | The [Managed Database ID](#operation/list-databases).
username = 'username_example' # String | The [database user](#operation/list-database-users).
opts = {
  update_database_user_request: VultrRuby::UpdateDatabaseUserRequest.new({password: 'password_example'}) # UpdateDatabaseUserRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Database User
  result = api_instance.update_database_user(database_id, username, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_database_user: #{e}"
end
```

#### Using the update_database_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDatabaseUser202Response>, Integer, Hash)> update_database_user_with_http_info(database_id, username, opts)

```ruby
begin
  # Update Database User
  data, status_code, headers = api_instance.update_database_user_with_http_info(database_id, username, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDatabaseUser202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->update_database_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **database_id** | **String** | The [Managed Database ID](#operation/list-databases). |  |
| **username** | **String** | The [database user](#operation/list-database-users). |  |
| **update_database_user_request** | [**UpdateDatabaseUserRequest**](UpdateDatabaseUserRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDatabaseUser202Response**](CreateDatabaseUser202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## view_migration_status

> <ViewMigrationStatus200Response> view_migration_status

Get Migration Status

View the status of a migration attached to the Managed Database.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::ManagedDatabasesApi.new

begin
  # Get Migration Status
  result = api_instance.view_migration_status
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->view_migration_status: #{e}"
end
```

#### Using the view_migration_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ViewMigrationStatus200Response>, Integer, Hash)> view_migration_status_with_http_info

```ruby
begin
  # Get Migration Status
  data, status_code, headers = api_instance.view_migration_status_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ViewMigrationStatus200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling ManagedDatabasesApi->view_migration_status_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ViewMigrationStatus200Response**](ViewMigrationStatus200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

