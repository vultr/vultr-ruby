# VultRuby::Database

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Managed Database. | [optional] |
| **date_created** | **String** | The date this database was created. | [optional] |
| **plan** | **String** | The name of the Managed Database plan. | [optional] |
| **plan_disk** | **Integer** | The size of the disk in GB (excluded for Redis engine types). | [optional] |
| **plan_ram** | **Integer** | The amount of RAM in MB. | [optional] |
| **plan_vcpus** | **Integer** | Number of vCPUs. | [optional] |
| **plan_replicas** | **Integer** | Number of replica nodes. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the Managed Database is located. | [optional] |
| **database_engine** | **String** | The database engine type (MySQL, PostgreSQL, FerretDB + PostgreSQL, Redis). | [optional] |
| **database_engine_version** | **String** | The version number of the database engine in use. | [optional] |
| **vpc_id** | **String** | The ID of the [VPC Network](#operation/get-vpc) attached to the Managed Database. | [optional] |
| **status** | **String** | The current status.  * Rebuilding * Rebalancing * Running | [optional] |
| **label** | **String** | The user-supplied label for this managed database. | [optional] |
| **tag** | **String** | The user-supplied tag for this managed database. | [optional] |
| **dbname** | **String** | The default database name. | [optional] |
| **ferretdb_credentials** | [**DatabaseFerretdbCredentials**](DatabaseFerretdbCredentials.md) |  | [optional] |
| **host** | **String** | The public hostname for database connections, or private hostname if this managed database is attached to a VPC network. | [optional] |
| **public_host** | **String** | The public hostname for database connections. Only visible when the managed database is attached to a VPC network. | [optional] |
| **user** | **String** | The default user configured on creation. | [optional] |
| **password** | **String** | The default user&#39;s secure password generated on creation. | [optional] |
| **port** | **String** | The assigned port for connecting to the Managed Database. | [optional] |
| **maintenance_dow** | **String** | The chosen date of week for routine maintenance updates. | [optional] |
| **maintenance_time** | **String** | The chosen hour for routine maintenance updates. | [optional] |
| **latest_backup** | **String** | The date for the latest backup stored on the Managed Database. | [optional] |
| **trusted_ips** | **Array&lt;String&gt;** | A list of trusted IP addresses for connecting to this Managed Database (in CIDR notation). | [optional] |
| **mysql_sql_modes** | **Array&lt;String&gt;** | A list names of enabled SQL Modes for MySQL engine types only. | [optional] |
| **mysql_require_primary_key** | **Boolean** | Configuration value for requiring table primary keys for MySQL engine types only. | [optional] |
| **mysql_slow_query_log** | **Boolean** | Configuration value for slow query logging on the Managed Database for MySQL engine types only. | [optional] |
| **mysql_long_query_time** | **Integer** | The number of seconds to denote a slow query when logging is enabled for MySQL engine types only. | [optional] |
| **pg_available_extensions** | **Array&lt;Object&gt;** | A list of objects containing names and versions (when applicable) of available extensions for PostgreSQL engine types only. | [optional] |
| **redis_eviction_policy** | **String** | The current configured data eviction policy for Redis engine types only. | [optional] |
| **cluster_time_zone** | **String** | The configured time zone of the Managed Database in TZ database format. | [optional] |
| **read_replicas** | **Array&lt;Object&gt;** | A list of database objects containing details for all attached read-only replica nodes. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Database.new(
  id: null,
  date_created: null,
  plan: null,
  plan_disk: null,
  plan_ram: null,
  plan_vcpus: null,
  plan_replicas: null,
  region: null,
  database_engine: null,
  database_engine_version: null,
  vpc_id: null,
  status: null,
  label: null,
  tag: null,
  dbname: null,
  ferretdb_credentials: null,
  host: null,
  public_host: null,
  user: null,
  password: null,
  port: null,
  maintenance_dow: null,
  maintenance_time: null,
  latest_backup: null,
  trusted_ips: null,
  mysql_sql_modes: null,
  mysql_require_primary_key: null,
  mysql_slow_query_log: null,
  mysql_long_query_time: null,
  pg_available_extensions: null,
  redis_eviction_policy: null,
  cluster_time_zone: null,
  read_replicas: null
)
```

