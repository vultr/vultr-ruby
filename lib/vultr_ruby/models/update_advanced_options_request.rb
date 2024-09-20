=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
Generator version: 7.9.0-SNAPSHOT

=end

require 'date'
require 'time'

module VultrRuby
  class UpdateAdvancedOptionsRequest
    # Accepted values: 0 - 1
    attr_accessor :autovacuum_analyze_scale_factor

    # Accepted values: 0 - 2147483647
    attr_accessor :autovacuum_analyze_threshold

    # Accepted values: 200000000 - 1500000000
    attr_accessor :autovacuum_freeze_max_age

    # Accepted values: 1 - 20
    attr_accessor :autovacuum_max_workers

    # Accepted values: 1 - 86400
    attr_accessor :autovacuum_naptime

    # Accepted values: -1 - 100
    attr_accessor :autovacuum_vacuum_cost_delay

    # Accepted values: -1 - 10000
    attr_accessor :autovacuum_vacuum_cost_limit

    # Accepted values: 0 - 1
    attr_accessor :autovacuum_vacuum_scale_factor

    # Accepted values: 0 - 2147483647
    attr_accessor :autovacuum_vacuum_threshold

    # Accepted values: 10 - 10000
    attr_accessor :bgwriter_delay

    # Accepted values: 0 - 2048
    attr_accessor :bgwriter_flush_after

    # Accepted values: 0 - 1073741823
    attr_accessor :bgwriter_lru_maxpages

    # Accepted values: 0 - 10
    attr_accessor :bgwriter_lru_multiplier

    # Accepted values: 500 - 1800000
    attr_accessor :deadlock_timeout

    # Accepted values: * `lz4` * `pglz`
    attr_accessor :default_toast_compression

    # Accepted values: 0 - 604800000
    attr_accessor :idle_in_transaction_session_timeout

    # Accepted values: * `true` * `false`
    attr_accessor :jit

    # Accepted values: -1 - 2147483647
    attr_accessor :log_autovacuum_min_duration

    # Accepted values: * `TERSE` * `DEFAULT` * `VERBOSE`
    attr_accessor :log_error_verbosity

    # Accepted values: * `'pid=%p,user=%u,db=%d,app=%a,client=%h '` * `'%t [%p]: [%l-1] user=%u,db=%d,app=%a,client=%h '` * `'%m [%p] %q[user=%u,db=%d,app=%a] '`
    attr_accessor :log_line_prefix

    # Accepted values: -1 - 86400000
    attr_accessor :log_min_duration_statement

    # Accepted values: 1000 - 4096
    attr_accessor :max_files_per_process

    # Accepted values: 64 - 6400
    attr_accessor :max_locks_per_transaction

    # Accepted values: 4 - 64
    attr_accessor :max_logical_replication_workers

    # Accepted values: 0 - 96
    attr_accessor :max_parallel_workers

    # Accepted values: 0 - 96
    attr_accessor :max_parallel_workers_per_gather

    # Accepted values: 64 - 5120
    attr_accessor :max_pred_locks_per_transaction

    # Accepted values: 0 - 10000
    attr_accessor :max_prepared_transactions

    # Accepted values: 8 - 64
    attr_accessor :max_replication_slots

    # Accepted values: 2097152 - 6291456
    attr_accessor :max_stack_depth

    # Accepted values: 1 - 43200000
    attr_accessor :max_standby_archive_delay

    # Accepted values: 1 - 43200000
    attr_accessor :max_standby_streaming_delay

    # Accepted values: 20 - 64
    attr_accessor :max_wal_senders

    # Accepted values: 8 - 96
    attr_accessor :max_worker_processes

    # Accepted values: 3600 - 604800
    attr_accessor :pg_partman_bgw_interval

    # Maximum length: 64 characters
    attr_accessor :pg_partman_bgw_role

    # Accepted values: * `all` * `top` * `none`
    attr_accessor :pg_stat_statements_track

    # Accepted values: -1 - 2147483647
    attr_accessor :temp_file_limit

    # Accepted values: 1024 - 10240
    attr_accessor :track_activity_query_size

    # Accepted values: * `off` * `on`
    attr_accessor :track_commit_timestamp

    # Accepted values: * `all` * `pl` * `none`
    attr_accessor :track_functions

    # Accepted values: * `off` * `on`
    attr_accessor :track_io_timing

    # Accepted values: 0, 5000 - 10800000
    attr_accessor :wal_sender_timeout

    # Accepted values: 10 - 200
    attr_accessor :wal_writer_delay

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'autovacuum_analyze_scale_factor' => :'autovacuum_analyze_scale_factor',
        :'autovacuum_analyze_threshold' => :'autovacuum_analyze_threshold',
        :'autovacuum_freeze_max_age' => :'autovacuum_freeze_max_age',
        :'autovacuum_max_workers' => :'autovacuum_max_workers',
        :'autovacuum_naptime' => :'autovacuum_naptime',
        :'autovacuum_vacuum_cost_delay' => :'autovacuum_vacuum_cost_delay',
        :'autovacuum_vacuum_cost_limit' => :'autovacuum_vacuum_cost_limit',
        :'autovacuum_vacuum_scale_factor' => :'autovacuum_vacuum_scale_factor',
        :'autovacuum_vacuum_threshold' => :'autovacuum_vacuum_threshold',
        :'bgwriter_delay' => :'bgwriter_delay',
        :'bgwriter_flush_after' => :'bgwriter_flush_after',
        :'bgwriter_lru_maxpages' => :'bgwriter_lru_maxpages',
        :'bgwriter_lru_multiplier' => :'bgwriter_lru_multiplier',
        :'deadlock_timeout' => :'deadlock_timeout',
        :'default_toast_compression' => :'default_toast_compression',
        :'idle_in_transaction_session_timeout' => :'idle_in_transaction_session_timeout',
        :'jit' => :'jit',
        :'log_autovacuum_min_duration' => :'log_autovacuum_min_duration',
        :'log_error_verbosity' => :'log_error_verbosity',
        :'log_line_prefix' => :'log_line_prefix',
        :'log_min_duration_statement' => :'log_min_duration_statement',
        :'max_files_per_process' => :'max_files_per_process',
        :'max_locks_per_transaction' => :'max_locks_per_transaction',
        :'max_logical_replication_workers' => :'max_logical_replication_workers',
        :'max_parallel_workers' => :'max_parallel_workers',
        :'max_parallel_workers_per_gather' => :'max_parallel_workers_per_gather',
        :'max_pred_locks_per_transaction' => :'max_pred_locks_per_transaction',
        :'max_prepared_transactions' => :'max_prepared_transactions',
        :'max_replication_slots' => :'max_replication_slots',
        :'max_stack_depth' => :'max_stack_depth',
        :'max_standby_archive_delay' => :'max_standby_archive_delay',
        :'max_standby_streaming_delay' => :'max_standby_streaming_delay',
        :'max_wal_senders' => :'max_wal_senders',
        :'max_worker_processes' => :'max_worker_processes',
        :'pg_partman_bgw_interval' => :'pg_partman_bgw.interval',
        :'pg_partman_bgw_role' => :'pg_partman_bgw.role',
        :'pg_stat_statements_track' => :'pg_stat_statements.track',
        :'temp_file_limit' => :'temp_file_limit',
        :'track_activity_query_size' => :'track_activity_query_size',
        :'track_commit_timestamp' => :'track_commit_timestamp',
        :'track_functions' => :'track_functions',
        :'track_io_timing' => :'track_io_timing',
        :'wal_sender_timeout' => :'wal_sender_timeout',
        :'wal_writer_delay' => :'wal_writer_delay'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'autovacuum_analyze_scale_factor' => :'Float',
        :'autovacuum_analyze_threshold' => :'Integer',
        :'autovacuum_freeze_max_age' => :'Integer',
        :'autovacuum_max_workers' => :'Integer',
        :'autovacuum_naptime' => :'Integer',
        :'autovacuum_vacuum_cost_delay' => :'Integer',
        :'autovacuum_vacuum_cost_limit' => :'Integer',
        :'autovacuum_vacuum_scale_factor' => :'Float',
        :'autovacuum_vacuum_threshold' => :'Integer',
        :'bgwriter_delay' => :'Integer',
        :'bgwriter_flush_after' => :'Integer',
        :'bgwriter_lru_maxpages' => :'Integer',
        :'bgwriter_lru_multiplier' => :'Float',
        :'deadlock_timeout' => :'Integer',
        :'default_toast_compression' => :'Enum',
        :'idle_in_transaction_session_timeout' => :'Integer',
        :'jit' => :'Boolean',
        :'log_autovacuum_min_duration' => :'Integer',
        :'log_error_verbosity' => :'Enum',
        :'log_line_prefix' => :'Enum',
        :'log_min_duration_statement' => :'Integer',
        :'max_files_per_process' => :'Integer',
        :'max_locks_per_transaction' => :'Integer',
        :'max_logical_replication_workers' => :'Integer',
        :'max_parallel_workers' => :'Integer',
        :'max_parallel_workers_per_gather' => :'Integer',
        :'max_pred_locks_per_transaction' => :'Integer',
        :'max_prepared_transactions' => :'Integer',
        :'max_replication_slots' => :'Integer',
        :'max_stack_depth' => :'Integer',
        :'max_standby_archive_delay' => :'Integer',
        :'max_standby_streaming_delay' => :'Integer',
        :'max_wal_senders' => :'Integer',
        :'max_worker_processes' => :'Integer',
        :'pg_partman_bgw_interval' => :'Integer',
        :'pg_partman_bgw_role' => :'String',
        :'pg_stat_statements_track' => :'Enum',
        :'temp_file_limit' => :'Integer',
        :'track_activity_query_size' => :'Integer',
        :'track_commit_timestamp' => :'Enum',
        :'track_functions' => :'Enum',
        :'track_io_timing' => :'Enum',
        :'wal_sender_timeout' => :'Integer',
        :'wal_writer_delay' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `VultrRuby::UpdateAdvancedOptionsRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VultrRuby::UpdateAdvancedOptionsRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'autovacuum_analyze_scale_factor')
        self.autovacuum_analyze_scale_factor = attributes[:'autovacuum_analyze_scale_factor']
      end

      if attributes.key?(:'autovacuum_analyze_threshold')
        self.autovacuum_analyze_threshold = attributes[:'autovacuum_analyze_threshold']
      end

      if attributes.key?(:'autovacuum_freeze_max_age')
        self.autovacuum_freeze_max_age = attributes[:'autovacuum_freeze_max_age']
      end

      if attributes.key?(:'autovacuum_max_workers')
        self.autovacuum_max_workers = attributes[:'autovacuum_max_workers']
      end

      if attributes.key?(:'autovacuum_naptime')
        self.autovacuum_naptime = attributes[:'autovacuum_naptime']
      end

      if attributes.key?(:'autovacuum_vacuum_cost_delay')
        self.autovacuum_vacuum_cost_delay = attributes[:'autovacuum_vacuum_cost_delay']
      end

      if attributes.key?(:'autovacuum_vacuum_cost_limit')
        self.autovacuum_vacuum_cost_limit = attributes[:'autovacuum_vacuum_cost_limit']
      end

      if attributes.key?(:'autovacuum_vacuum_scale_factor')
        self.autovacuum_vacuum_scale_factor = attributes[:'autovacuum_vacuum_scale_factor']
      end

      if attributes.key?(:'autovacuum_vacuum_threshold')
        self.autovacuum_vacuum_threshold = attributes[:'autovacuum_vacuum_threshold']
      end

      if attributes.key?(:'bgwriter_delay')
        self.bgwriter_delay = attributes[:'bgwriter_delay']
      end

      if attributes.key?(:'bgwriter_flush_after')
        self.bgwriter_flush_after = attributes[:'bgwriter_flush_after']
      end

      if attributes.key?(:'bgwriter_lru_maxpages')
        self.bgwriter_lru_maxpages = attributes[:'bgwriter_lru_maxpages']
      end

      if attributes.key?(:'bgwriter_lru_multiplier')
        self.bgwriter_lru_multiplier = attributes[:'bgwriter_lru_multiplier']
      end

      if attributes.key?(:'deadlock_timeout')
        self.deadlock_timeout = attributes[:'deadlock_timeout']
      end

      if attributes.key?(:'default_toast_compression')
        self.default_toast_compression = attributes[:'default_toast_compression']
      end

      if attributes.key?(:'idle_in_transaction_session_timeout')
        self.idle_in_transaction_session_timeout = attributes[:'idle_in_transaction_session_timeout']
      end

      if attributes.key?(:'jit')
        self.jit = attributes[:'jit']
      end

      if attributes.key?(:'log_autovacuum_min_duration')
        self.log_autovacuum_min_duration = attributes[:'log_autovacuum_min_duration']
      end

      if attributes.key?(:'log_error_verbosity')
        self.log_error_verbosity = attributes[:'log_error_verbosity']
      end

      if attributes.key?(:'log_line_prefix')
        self.log_line_prefix = attributes[:'log_line_prefix']
      end

      if attributes.key?(:'log_min_duration_statement')
        self.log_min_duration_statement = attributes[:'log_min_duration_statement']
      end

      if attributes.key?(:'max_files_per_process')
        self.max_files_per_process = attributes[:'max_files_per_process']
      end

      if attributes.key?(:'max_locks_per_transaction')
        self.max_locks_per_transaction = attributes[:'max_locks_per_transaction']
      end

      if attributes.key?(:'max_logical_replication_workers')
        self.max_logical_replication_workers = attributes[:'max_logical_replication_workers']
      end

      if attributes.key?(:'max_parallel_workers')
        self.max_parallel_workers = attributes[:'max_parallel_workers']
      end

      if attributes.key?(:'max_parallel_workers_per_gather')
        self.max_parallel_workers_per_gather = attributes[:'max_parallel_workers_per_gather']
      end

      if attributes.key?(:'max_pred_locks_per_transaction')
        self.max_pred_locks_per_transaction = attributes[:'max_pred_locks_per_transaction']
      end

      if attributes.key?(:'max_prepared_transactions')
        self.max_prepared_transactions = attributes[:'max_prepared_transactions']
      end

      if attributes.key?(:'max_replication_slots')
        self.max_replication_slots = attributes[:'max_replication_slots']
      end

      if attributes.key?(:'max_stack_depth')
        self.max_stack_depth = attributes[:'max_stack_depth']
      end

      if attributes.key?(:'max_standby_archive_delay')
        self.max_standby_archive_delay = attributes[:'max_standby_archive_delay']
      end

      if attributes.key?(:'max_standby_streaming_delay')
        self.max_standby_streaming_delay = attributes[:'max_standby_streaming_delay']
      end

      if attributes.key?(:'max_wal_senders')
        self.max_wal_senders = attributes[:'max_wal_senders']
      end

      if attributes.key?(:'max_worker_processes')
        self.max_worker_processes = attributes[:'max_worker_processes']
      end

      if attributes.key?(:'pg_partman_bgw_interval')
        self.pg_partman_bgw_interval = attributes[:'pg_partman_bgw_interval']
      end

      if attributes.key?(:'pg_partman_bgw_role')
        self.pg_partman_bgw_role = attributes[:'pg_partman_bgw_role']
      end

      if attributes.key?(:'pg_stat_statements_track')
        self.pg_stat_statements_track = attributes[:'pg_stat_statements_track']
      end

      if attributes.key?(:'temp_file_limit')
        self.temp_file_limit = attributes[:'temp_file_limit']
      end

      if attributes.key?(:'track_activity_query_size')
        self.track_activity_query_size = attributes[:'track_activity_query_size']
      end

      if attributes.key?(:'track_commit_timestamp')
        self.track_commit_timestamp = attributes[:'track_commit_timestamp']
      end

      if attributes.key?(:'track_functions')
        self.track_functions = attributes[:'track_functions']
      end

      if attributes.key?(:'track_io_timing')
        self.track_io_timing = attributes[:'track_io_timing']
      end

      if attributes.key?(:'wal_sender_timeout')
        self.wal_sender_timeout = attributes[:'wal_sender_timeout']
      end

      if attributes.key?(:'wal_writer_delay')
        self.wal_writer_delay = attributes[:'wal_writer_delay']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          autovacuum_analyze_scale_factor == o.autovacuum_analyze_scale_factor &&
          autovacuum_analyze_threshold == o.autovacuum_analyze_threshold &&
          autovacuum_freeze_max_age == o.autovacuum_freeze_max_age &&
          autovacuum_max_workers == o.autovacuum_max_workers &&
          autovacuum_naptime == o.autovacuum_naptime &&
          autovacuum_vacuum_cost_delay == o.autovacuum_vacuum_cost_delay &&
          autovacuum_vacuum_cost_limit == o.autovacuum_vacuum_cost_limit &&
          autovacuum_vacuum_scale_factor == o.autovacuum_vacuum_scale_factor &&
          autovacuum_vacuum_threshold == o.autovacuum_vacuum_threshold &&
          bgwriter_delay == o.bgwriter_delay &&
          bgwriter_flush_after == o.bgwriter_flush_after &&
          bgwriter_lru_maxpages == o.bgwriter_lru_maxpages &&
          bgwriter_lru_multiplier == o.bgwriter_lru_multiplier &&
          deadlock_timeout == o.deadlock_timeout &&
          default_toast_compression == o.default_toast_compression &&
          idle_in_transaction_session_timeout == o.idle_in_transaction_session_timeout &&
          jit == o.jit &&
          log_autovacuum_min_duration == o.log_autovacuum_min_duration &&
          log_error_verbosity == o.log_error_verbosity &&
          log_line_prefix == o.log_line_prefix &&
          log_min_duration_statement == o.log_min_duration_statement &&
          max_files_per_process == o.max_files_per_process &&
          max_locks_per_transaction == o.max_locks_per_transaction &&
          max_logical_replication_workers == o.max_logical_replication_workers &&
          max_parallel_workers == o.max_parallel_workers &&
          max_parallel_workers_per_gather == o.max_parallel_workers_per_gather &&
          max_pred_locks_per_transaction == o.max_pred_locks_per_transaction &&
          max_prepared_transactions == o.max_prepared_transactions &&
          max_replication_slots == o.max_replication_slots &&
          max_stack_depth == o.max_stack_depth &&
          max_standby_archive_delay == o.max_standby_archive_delay &&
          max_standby_streaming_delay == o.max_standby_streaming_delay &&
          max_wal_senders == o.max_wal_senders &&
          max_worker_processes == o.max_worker_processes &&
          pg_partman_bgw_interval == o.pg_partman_bgw_interval &&
          pg_partman_bgw_role == o.pg_partman_bgw_role &&
          pg_stat_statements_track == o.pg_stat_statements_track &&
          temp_file_limit == o.temp_file_limit &&
          track_activity_query_size == o.track_activity_query_size &&
          track_commit_timestamp == o.track_commit_timestamp &&
          track_functions == o.track_functions &&
          track_io_timing == o.track_io_timing &&
          wal_sender_timeout == o.wal_sender_timeout &&
          wal_writer_delay == o.wal_writer_delay
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [autovacuum_analyze_scale_factor, autovacuum_analyze_threshold, autovacuum_freeze_max_age, autovacuum_max_workers, autovacuum_naptime, autovacuum_vacuum_cost_delay, autovacuum_vacuum_cost_limit, autovacuum_vacuum_scale_factor, autovacuum_vacuum_threshold, bgwriter_delay, bgwriter_flush_after, bgwriter_lru_maxpages, bgwriter_lru_multiplier, deadlock_timeout, default_toast_compression, idle_in_transaction_session_timeout, jit, log_autovacuum_min_duration, log_error_verbosity, log_line_prefix, log_min_duration_statement, max_files_per_process, max_locks_per_transaction, max_logical_replication_workers, max_parallel_workers, max_parallel_workers_per_gather, max_pred_locks_per_transaction, max_prepared_transactions, max_replication_slots, max_stack_depth, max_standby_archive_delay, max_standby_streaming_delay, max_wal_senders, max_worker_processes, pg_partman_bgw_interval, pg_partman_bgw_role, pg_stat_statements_track, temp_file_limit, track_activity_query_size, track_commit_timestamp, track_functions, track_io_timing, wal_sender_timeout, wal_writer_delay].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = VultrRuby.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
