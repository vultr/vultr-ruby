# VultrRuby::UpdateAdvancedOptionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **autovacuum_analyze_scale_factor** | **Float** | Accepted values: 0 - 1 | [optional] |
| **autovacuum_analyze_threshold** | **Integer** | Accepted values: 0 - 2147483647 | [optional] |
| **autovacuum_freeze_max_age** | **Integer** | Accepted values: 200000000 - 1500000000 | [optional] |
| **autovacuum_max_workers** | **Integer** | Accepted values: 1 - 20 | [optional] |
| **autovacuum_naptime** | **Integer** | Accepted values: 1 - 86400 | [optional] |
| **autovacuum_vacuum_cost_delay** | **Integer** | Accepted values: -1 - 100 | [optional] |
| **autovacuum_vacuum_cost_limit** | **Integer** | Accepted values: -1 - 10000 | [optional] |
| **autovacuum_vacuum_scale_factor** | **Float** | Accepted values: 0 - 1 | [optional] |
| **autovacuum_vacuum_threshold** | **Integer** | Accepted values: 0 - 2147483647 | [optional] |
| **bgwriter_delay** | **Integer** | Accepted values: 10 - 10000 | [optional] |
| **bgwriter_flush_after** | **Integer** | Accepted values: 0 - 2048 | [optional] |
| **bgwriter_lru_maxpages** | **Integer** | Accepted values: 0 - 1073741823 | [optional] |
| **bgwriter_lru_multiplier** | **Float** | Accepted values: 0 - 10 | [optional] |
| **deadlock_timeout** | **Integer** | Accepted values: 500 - 1800000 | [optional] |
| **default_toast_compression** | [**Enum**](Enum.md) | Accepted values: * &#x60;lz4&#x60; * &#x60;pglz&#x60; | [optional] |
| **idle_in_transaction_session_timeout** | **Integer** | Accepted values: 0 - 604800000 | [optional] |
| **jit** | **Boolean** | Accepted values: * &#x60;true&#x60; * &#x60;false&#x60; | [optional] |
| **log_autovacuum_min_duration** | **Integer** | Accepted values: -1 - 2147483647 | [optional] |
| **log_error_verbosity** | [**Enum**](Enum.md) | Accepted values: * &#x60;TERSE&#x60; * &#x60;DEFAULT&#x60; * &#x60;VERBOSE&#x60; | [optional] |
| **log_line_prefix** | [**Enum**](Enum.md) | Accepted values: * &#x60;&#39;pid&#x3D;%p,user&#x3D;%u,db&#x3D;%d,app&#x3D;%a,client&#x3D;%h &#39;&#x60; * &#x60;&#39;%t [%p]: [%l-1] user&#x3D;%u,db&#x3D;%d,app&#x3D;%a,client&#x3D;%h &#39;&#x60; * &#x60;&#39;%m [%p] %q[user&#x3D;%u,db&#x3D;%d,app&#x3D;%a] &#39;&#x60; | [optional] |
| **log_min_duration_statement** | **Integer** | Accepted values: -1 - 86400000 | [optional] |
| **max_files_per_process** | **Integer** | Accepted values: 1000 - 4096 | [optional] |
| **max_locks_per_transaction** | **Integer** | Accepted values: 64 - 6400 | [optional] |
| **max_logical_replication_workers** | **Integer** | Accepted values: 4 - 64 | [optional] |
| **max_parallel_workers** | **Integer** | Accepted values: 0 - 96 | [optional] |
| **max_parallel_workers_per_gather** | **Integer** | Accepted values: 0 - 96 | [optional] |
| **max_pred_locks_per_transaction** | **Integer** | Accepted values: 64 - 5120 | [optional] |
| **max_prepared_transactions** | **Integer** | Accepted values: 0 - 10000 | [optional] |
| **max_replication_slots** | **Integer** | Accepted values: 8 - 64 | [optional] |
| **max_stack_depth** | **Integer** | Accepted values: 2097152 - 6291456 | [optional] |
| **max_standby_archive_delay** | **Integer** | Accepted values: 1 - 43200000 | [optional] |
| **max_standby_streaming_delay** | **Integer** | Accepted values: 1 - 43200000 | [optional] |
| **max_wal_senders** | **Integer** | Accepted values: 20 - 64 | [optional] |
| **max_worker_processes** | **Integer** | Accepted values: 8 - 96 | [optional] |
| **pg_partman_bgw_interval** | **Integer** | Accepted values: 3600 - 604800 | [optional] |
| **pg_partman_bgw_role** | **String** | Maximum length: 64 characters | [optional] |
| **pg_stat_statements_track** | [**Enum**](Enum.md) | Accepted values: * &#x60;all&#x60; * &#x60;top&#x60; * &#x60;none&#x60; | [optional] |
| **temp_file_limit** | **Integer** | Accepted values: -1 - 2147483647 | [optional] |
| **track_activity_query_size** | **Integer** | Accepted values: 1024 - 10240 | [optional] |
| **track_commit_timestamp** | [**Enum**](Enum.md) | Accepted values: * &#x60;off&#x60; * &#x60;on&#x60; | [optional] |
| **track_functions** | [**Enum**](Enum.md) | Accepted values: * &#x60;all&#x60; * &#x60;pl&#x60; * &#x60;none&#x60; | [optional] |
| **track_io_timing** | [**Enum**](Enum.md) | Accepted values: * &#x60;off&#x60; * &#x60;on&#x60; | [optional] |
| **wal_sender_timeout** | **Integer** | Accepted values: 0, 5000 - 10800000 | [optional] |
| **wal_writer_delay** | **Integer** | Accepted values: 10 - 200 | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateAdvancedOptionsRequest.new(
  autovacuum_analyze_scale_factor: null,
  autovacuum_analyze_threshold: null,
  autovacuum_freeze_max_age: null,
  autovacuum_max_workers: null,
  autovacuum_naptime: null,
  autovacuum_vacuum_cost_delay: null,
  autovacuum_vacuum_cost_limit: null,
  autovacuum_vacuum_scale_factor: null,
  autovacuum_vacuum_threshold: null,
  bgwriter_delay: null,
  bgwriter_flush_after: null,
  bgwriter_lru_maxpages: null,
  bgwriter_lru_multiplier: null,
  deadlock_timeout: null,
  default_toast_compression: null,
  idle_in_transaction_session_timeout: null,
  jit: null,
  log_autovacuum_min_duration: null,
  log_error_verbosity: null,
  log_line_prefix: null,
  log_min_duration_statement: null,
  max_files_per_process: null,
  max_locks_per_transaction: null,
  max_logical_replication_workers: null,
  max_parallel_workers: null,
  max_parallel_workers_per_gather: null,
  max_pred_locks_per_transaction: null,
  max_prepared_transactions: null,
  max_replication_slots: null,
  max_stack_depth: null,
  max_standby_archive_delay: null,
  max_standby_streaming_delay: null,
  max_wal_senders: null,
  max_worker_processes: null,
  pg_partman_bgw_interval: null,
  pg_partman_bgw_role: null,
  pg_stat_statements_track: null,
  temp_file_limit: null,
  track_activity_query_size: null,
  track_commit_timestamp: null,
  track_functions: null,
  track_io_timing: null,
  wal_sender_timeout: null,
  wal_writer_delay: null
)
```

