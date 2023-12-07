=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.2.0-SNAPSHOT

=end

require 'cgi'

module VultrRuby
  class ManagedDatabasesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Connection Pool
    # Create a new connection pool within the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateConnectionPoolRequest] :create_connection_pool_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateConnectionPool202Response]
    def create_connection_pool(opts = {})
      data, _status_code, _headers = create_connection_pool_with_http_info(opts)
      data
    end

    # Create Connection Pool
    # Create a new connection pool within the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateConnectionPoolRequest] :create_connection_pool_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateConnectionPool202Response, Integer, Hash)>] CreateConnectionPool202Response data, response status code and response headers
    def create_connection_pool_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.create_connection_pool ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/connection-pools'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_connection_pool_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateConnectionPool202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.create_connection_pool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#create_connection_pool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Managed Database
    # Create a new Managed Database in a `region` with the desired `plan`. Supply optional attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateDatabaseRequest] :create_database_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabase202Response]
    def create_database(opts = {})
      data, _status_code, _headers = create_database_with_http_info(opts)
      data
    end

    # Create Managed Database
    # Create a new Managed Database in a &#x60;region&#x60; with the desired &#x60;plan&#x60;. Supply optional attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateDatabaseRequest] :create_database_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabase202Response, Integer, Hash)>] CreateDatabase202Response data, response status code and response headers
    def create_database_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.create_database ...'
      end
      # resource path
      local_var_path = '/databases'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_database_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabase202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.create_database",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#create_database\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Logical Database
    # Create a new logical database within the Managed Database (MySQL and PostgreSQL only).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateDatabaseDbRequest] :create_database_db_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabaseDb202Response]
    def create_database_db(opts = {})
      data, _status_code, _headers = create_database_db_with_http_info(opts)
      data
    end

    # Create Logical Database
    # Create a new logical database within the Managed Database (MySQL and PostgreSQL only).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateDatabaseDbRequest] :create_database_db_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabaseDb202Response, Integer, Hash)>] CreateDatabaseDb202Response data, response status code and response headers
    def create_database_db_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.create_database_db ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/dbs'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_database_db_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabaseDb202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.create_database_db",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#create_database_db\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Database User
    # Create a new database user within the Managed Database. Supply optional attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateDatabaseUserRequest] :create_database_user_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabaseUser202Response]
    def create_database_user(opts = {})
      data, _status_code, _headers = create_database_user_with_http_info(opts)
      data
    end

    # Create Database User
    # Create a new database user within the Managed Database. Supply optional attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateDatabaseUserRequest] :create_database_user_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabaseUser202Response, Integer, Hash)>] CreateDatabaseUser202Response data, response status code and response headers
    def create_database_user_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.create_database_user ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/users'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_database_user_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabaseUser202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.create_database_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#create_database_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Add Read-Only Replica
    # Create a read-only replica node for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseAddReadReplicaRequest] :database_add_read_replica_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabase202Response]
    def database_add_read_replica(opts = {})
      data, _status_code, _headers = database_add_read_replica_with_http_info(opts)
      data
    end

    # Add Read-Only Replica
    # Create a read-only replica node for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseAddReadReplicaRequest] :database_add_read_replica_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabase202Response, Integer, Hash)>] CreateDatabase202Response data, response status code and response headers
    def database_add_read_replica_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.database_add_read_replica ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/read-replica'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'database_add_read_replica_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabase202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.database_add_read_replica",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#database_add_read_replica\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Detach Migration
    # Detach a migration from the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def database_detach_migration(opts = {})
      database_detach_migration_with_http_info(opts)
      nil
    end

    # Detach Migration
    # Detach a migration from the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def database_detach_migration_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.database_detach_migration ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/migration'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.database_detach_migration",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#database_detach_migration\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fork Managed Database
    # Fork a Managed Database to a new subscription from a backup.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseForkRequest] :database_fork_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabase202Response]
    def database_fork(opts = {})
      data, _status_code, _headers = database_fork_with_http_info(opts)
      data
    end

    # Fork Managed Database
    # Fork a Managed Database to a new subscription from a backup.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseForkRequest] :database_fork_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabase202Response, Integer, Hash)>] CreateDatabase202Response data, response status code and response headers
    def database_fork_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.database_fork ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/fork'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'database_fork_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabase202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.database_fork",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#database_fork\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Promote Read-Only Replica
    # Promote a read-only replica node to its own primary Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def database_promote_read_replica(opts = {})
      database_promote_read_replica_with_http_info(opts)
      nil
    end

    # Promote Read-Only Replica
    # Promote a read-only replica node to its own primary Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def database_promote_read_replica_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.database_promote_read_replica ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/promote-read-replica'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.database_promote_read_replica",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#database_promote_read_replica\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Restore from Backup
    # Create a new Managed Database from a backup.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseRestoreFromBackupRequest] :database_restore_from_backup_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabase202Response]
    def database_restore_from_backup(opts = {})
      data, _status_code, _headers = database_restore_from_backup_with_http_info(opts)
      data
    end

    # Restore from Backup
    # Create a new Managed Database from a backup.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseRestoreFromBackupRequest] :database_restore_from_backup_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabase202Response, Integer, Hash)>] CreateDatabase202Response data, response status code and response headers
    def database_restore_from_backup_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.database_restore_from_backup ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/restore'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'database_restore_from_backup_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabase202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.database_restore_from_backup",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#database_restore_from_backup\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start Migration
    # Start a migration to the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseStartMigrationRequest] :database_start_migration_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [ViewMigrationStatus200Response]
    def database_start_migration(opts = {})
      data, _status_code, _headers = database_start_migration_with_http_info(opts)
      data
    end

    # Start Migration
    # Start a migration to the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [DatabaseStartMigrationRequest] :database_start_migration_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(ViewMigrationStatus200Response, Integer, Hash)>] ViewMigrationStatus200Response data, response status code and response headers
    def database_start_migration_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.database_start_migration ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/migration'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'database_start_migration_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'ViewMigrationStatus200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.database_start_migration",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#database_start_migration\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Connection Pool
    # Delete a connection pool within a Managed Database (PostgreSQL engine types only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param pool_name [String] The [connection pool name](#operation/list-connection-pools).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_connection_pool(database_id, pool_name, opts = {})
      delete_connection_pool_with_http_info(database_id, pool_name, opts)
      nil
    end

    # Delete Connection Pool
    # Delete a connection pool within a Managed Database (PostgreSQL engine types only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param pool_name [String] The [connection pool name](#operation/list-connection-pools).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_connection_pool_with_http_info(database_id, pool_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.delete_connection_pool ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.delete_connection_pool"
      end
      # verify the required parameter 'pool_name' is set
      if @api_client.config.client_side_validation && pool_name.nil?
        fail ArgumentError, "Missing the required parameter 'pool_name' when calling ManagedDatabasesApi.delete_connection_pool"
      end
      # resource path
      local_var_path = '/databases/{database-id}/connection-pools/{pool-name}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'pool-name' + '}', CGI.escape(pool_name.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.delete_connection_pool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#delete_connection_pool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Managed Database
    # Delete a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_database(database_id, opts = {})
      delete_database_with_http_info(database_id, opts)
      nil
    end

    # Delete Managed Database
    # Delete a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_database_with_http_info(database_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.delete_database ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.delete_database"
      end
      # resource path
      local_var_path = '/databases/{database-id}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.delete_database",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#delete_database\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Logical Database
    # Delete a logical database within a Managed Database (MySQL and PostgreSQL only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param db_name [String] The [logical database name](#operation/list-database-dbs).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_database_db(database_id, db_name, opts = {})
      delete_database_db_with_http_info(database_id, db_name, opts)
      nil
    end

    # Delete Logical Database
    # Delete a logical database within a Managed Database (MySQL and PostgreSQL only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param db_name [String] The [logical database name](#operation/list-database-dbs).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_database_db_with_http_info(database_id, db_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.delete_database_db ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.delete_database_db"
      end
      # verify the required parameter 'db_name' is set
      if @api_client.config.client_side_validation && db_name.nil?
        fail ArgumentError, "Missing the required parameter 'db_name' when calling ManagedDatabasesApi.delete_database_db"
      end
      # resource path
      local_var_path = '/databases/{database-id}/dbs/{db-name}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'db-name' + '}', CGI.escape(db_name.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.delete_database_db",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#delete_database_db\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Database User
    # Delete a database user within a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_database_user(database_id, username, opts = {})
      delete_database_user_with_http_info(database_id, username, opts)
      nil
    end

    # Delete Database User
    # Delete a database user within a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_database_user_with_http_info(database_id, username, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.delete_database_user ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.delete_database_user"
      end
      # verify the required parameter 'username' is set
      if @api_client.config.client_side_validation && username.nil?
        fail ArgumentError, "Missing the required parameter 'username' when calling ManagedDatabasesApi.delete_database_user"
      end
      # resource path
      local_var_path = '/databases/{database-id}/users/{username}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'username' + '}', CGI.escape(username.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.delete_database_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#delete_database_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Backup Information
    # Get backup information for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [GetBackupInformation200Response]
    def get_backup_information(opts = {})
      data, _status_code, _headers = get_backup_information_with_http_info(opts)
      data
    end

    # Get Backup Information
    # Get backup information for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetBackupInformation200Response, Integer, Hash)>] GetBackupInformation200Response data, response status code and response headers
    def get_backup_information_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.get_backup_information ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/backups'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetBackupInformation200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.get_backup_information",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#get_backup_information\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Connection Pool
    # Get information about a Managed Database connection pool (PostgreSQL engine types only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param pool_name [String] The [connection pool name](#operation/list-connection-pools).
    # @param [Hash] opts the optional parameters
    # @return [CreateConnectionPool202Response]
    def get_connection_pool(database_id, pool_name, opts = {})
      data, _status_code, _headers = get_connection_pool_with_http_info(database_id, pool_name, opts)
      data
    end

    # Get Connection Pool
    # Get information about a Managed Database connection pool (PostgreSQL engine types only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param pool_name [String] The [connection pool name](#operation/list-connection-pools).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateConnectionPool202Response, Integer, Hash)>] CreateConnectionPool202Response data, response status code and response headers
    def get_connection_pool_with_http_info(database_id, pool_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.get_connection_pool ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.get_connection_pool"
      end
      # verify the required parameter 'pool_name' is set
      if @api_client.config.client_side_validation && pool_name.nil?
        fail ArgumentError, "Missing the required parameter 'pool_name' when calling ManagedDatabasesApi.get_connection_pool"
      end
      # resource path
      local_var_path = '/databases/{database-id}/connection-pools/{pool-name}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'pool-name' + '}', CGI.escape(pool_name.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CreateConnectionPool202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.get_connection_pool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#get_connection_pool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Managed Database
    # Get information about a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param [Hash] opts the optional parameters
    # @return [CreateDatabase202Response]
    def get_database(database_id, opts = {})
      data, _status_code, _headers = get_database_with_http_info(database_id, opts)
      data
    end

    # Get Managed Database
    # Get information about a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateDatabase202Response, Integer, Hash)>] CreateDatabase202Response data, response status code and response headers
    def get_database_with_http_info(database_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.get_database ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.get_database"
      end
      # resource path
      local_var_path = '/databases/{database-id}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabase202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.get_database",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#get_database\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Logical Database
    # Get information about a logical database within a Managed Database (MySQL and PostgreSQL only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param db_name [String] The [logical database name](#operation/list-database-dbs).
    # @param [Hash] opts the optional parameters
    # @return [CreateDatabaseDb202Response]
    def get_database_db(database_id, db_name, opts = {})
      data, _status_code, _headers = get_database_db_with_http_info(database_id, db_name, opts)
      data
    end

    # Get Logical Database
    # Get information about a logical database within a Managed Database (MySQL and PostgreSQL only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param db_name [String] The [logical database name](#operation/list-database-dbs).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateDatabaseDb202Response, Integer, Hash)>] CreateDatabaseDb202Response data, response status code and response headers
    def get_database_db_with_http_info(database_id, db_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.get_database_db ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.get_database_db"
      end
      # verify the required parameter 'db_name' is set
      if @api_client.config.client_side_validation && db_name.nil?
        fail ArgumentError, "Missing the required parameter 'db_name' when calling ManagedDatabasesApi.get_database_db"
      end
      # resource path
      local_var_path = '/databases/{database-id}/dbs/{db-name}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'db-name' + '}', CGI.escape(db_name.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabaseDb202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.get_database_db",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#get_database_db\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Database Usage Information
    # Get disk, memory, and vCPU usage information for a Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [GetDatabaseUsage200Response]
    def get_database_usage(opts = {})
      data, _status_code, _headers = get_database_usage_with_http_info(opts)
      data
    end

    # Get Database Usage Information
    # Get disk, memory, and vCPU usage information for a Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetDatabaseUsage200Response, Integer, Hash)>] GetDatabaseUsage200Response data, response status code and response headers
    def get_database_usage_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.get_database_usage ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/usage'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetDatabaseUsage200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.get_database_usage",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#get_database_usage\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Database User
    # Get information about a Managed Database user.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @return [CreateDatabaseUser202Response]
    def get_database_user(database_id, username, opts = {})
      data, _status_code, _headers = get_database_user_with_http_info(database_id, username, opts)
      data
    end

    # Get Database User
    # Get information about a Managed Database user.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateDatabaseUser202Response, Integer, Hash)>] CreateDatabaseUser202Response data, response status code and response headers
    def get_database_user_with_http_info(database_id, username, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.get_database_user ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.get_database_user"
      end
      # verify the required parameter 'username' is set
      if @api_client.config.client_side_validation && username.nil?
        fail ArgumentError, "Missing the required parameter 'username' when calling ManagedDatabasesApi.get_database_user"
      end
      # resource path
      local_var_path = '/databases/{database-id}/users/{username}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'username' + '}', CGI.escape(username.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabaseUser202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.get_database_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#get_database_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Advanced Options
    # List all configured and available advanced options for the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @return [ListAdvancedOptions200Response]
    def list_advanced_options(opts = {})
      data, _status_code, _headers = list_advanced_options_with_http_info(opts)
      data
    end

    # List Advanced Options
    # List all configured and available advanced options for the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListAdvancedOptions200Response, Integer, Hash)>] ListAdvancedOptions200Response data, response status code and response headers
    def list_advanced_options_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_advanced_options ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/advanced-options'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListAdvancedOptions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_advanced_options",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_advanced_options\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Available Versions
    # List all available version upgrades within the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @return [ListAvailableVersions200Response]
    def list_available_versions(opts = {})
      data, _status_code, _headers = list_available_versions_with_http_info(opts)
      data
    end

    # List Available Versions
    # List all available version upgrades within the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListAvailableVersions200Response, Integer, Hash)>] ListAvailableVersions200Response data, response status code and response headers
    def list_available_versions_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_available_versions ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/version-upgrade'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListAvailableVersions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_available_versions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_available_versions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Connection Pools
    # List all connection pools within the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @return [ListConnectionPools200Response]
    def list_connection_pools(opts = {})
      data, _status_code, _headers = list_connection_pools_with_http_info(opts)
      data
    end

    # List Connection Pools
    # List all connection pools within the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListConnectionPools200Response, Integer, Hash)>] ListConnectionPools200Response data, response status code and response headers
    def list_connection_pools_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_connection_pools ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/connection-pools'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListConnectionPools200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_connection_pools",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_connection_pools\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Logical Databases
    # List all logical databases within the Managed Database (MySQL and PostgreSQL only).
    # @param [Hash] opts the optional parameters
    # @return [ListDatabaseDbs200Response]
    def list_database_dbs(opts = {})
      data, _status_code, _headers = list_database_dbs_with_http_info(opts)
      data
    end

    # List Logical Databases
    # List all logical databases within the Managed Database (MySQL and PostgreSQL only).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListDatabaseDbs200Response, Integer, Hash)>] ListDatabaseDbs200Response data, response status code and response headers
    def list_database_dbs_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_database_dbs ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/dbs'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListDatabaseDbs200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_database_dbs",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_database_dbs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Managed Database Plans
    # List all Managed Databases plans.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :engine Filter by engine type  * &#x60;mysql&#x60; * &#x60;pg&#x60; * &#x60;redis&#x60;.
    # @option opts [Integer] :nodes Filter by number of nodes.
    # @option opts [String] :region Filter by [Region id](#operation/list-regions).
    # @return [ListDatabasePlans200Response]
    def list_database_plans(opts = {})
      data, _status_code, _headers = list_database_plans_with_http_info(opts)
      data
    end

    # List Managed Database Plans
    # List all Managed Databases plans.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :engine Filter by engine type  * &#x60;mysql&#x60; * &#x60;pg&#x60; * &#x60;redis&#x60;.
    # @option opts [Integer] :nodes Filter by number of nodes.
    # @option opts [String] :region Filter by [Region id](#operation/list-regions).
    # @return [Array<(ListDatabasePlans200Response, Integer, Hash)>] ListDatabasePlans200Response data, response status code and response headers
    def list_database_plans_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_database_plans ...'
      end
      # resource path
      local_var_path = '/databases/plans'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'engine'] = opts[:'engine'] if !opts[:'engine'].nil?
      query_params[:'nodes'] = opts[:'nodes'] if !opts[:'nodes'].nil?
      query_params[:'region'] = opts[:'region'] if !opts[:'region'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListDatabasePlans200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_database_plans",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_database_plans\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Database Users
    # List all database users within the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [ListDatabaseUsers200Response]
    def list_database_users(opts = {})
      data, _status_code, _headers = list_database_users_with_http_info(opts)
      data
    end

    # List Database Users
    # List all database users within the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListDatabaseUsers200Response, Integer, Hash)>] ListDatabaseUsers200Response data, response status code and response headers
    def list_database_users_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_database_users ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/users'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListDatabaseUsers200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_database_users",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_database_users\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Managed Databases
    # List all Managed Databases in your account.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :label Filter by label.
    # @option opts [String] :tag Filter by specific tag.
    # @option opts [String] :region Filter by [Region id](#operation/list-regions).
    # @return [ListDatabases200Response]
    def list_databases(opts = {})
      data, _status_code, _headers = list_databases_with_http_info(opts)
      data
    end

    # List Managed Databases
    # List all Managed Databases in your account.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :label Filter by label.
    # @option opts [String] :tag Filter by specific tag.
    # @option opts [String] :region Filter by [Region id](#operation/list-regions).
    # @return [Array<(ListDatabases200Response, Integer, Hash)>] ListDatabases200Response data, response status code and response headers
    def list_databases_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_databases ...'
      end
      # resource path
      local_var_path = '/databases'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'label'] = opts[:'label'] if !opts[:'label'].nil?
      query_params[:'tag'] = opts[:'tag'] if !opts[:'tag'].nil?
      query_params[:'region'] = opts[:'region'] if !opts[:'region'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListDatabases200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_databases",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_databases\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Maintenance Updates
    # List all available version upgrades within the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [ListMaintenanceUpdates200Response]
    def list_maintenance_updates(opts = {})
      data, _status_code, _headers = list_maintenance_updates_with_http_info(opts)
      data
    end

    # List Maintenance Updates
    # List all available version upgrades within the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListMaintenanceUpdates200Response, Integer, Hash)>] ListMaintenanceUpdates200Response data, response status code and response headers
    def list_maintenance_updates_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_maintenance_updates ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/maintenance'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListMaintenanceUpdates200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_maintenance_updates",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_maintenance_updates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Service Alerts
    # List service alert messages for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [ListServiceAlertsRequest] :list_service_alerts_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [ListServiceAlerts200Response]
    def list_service_alerts(opts = {})
      data, _status_code, _headers = list_service_alerts_with_http_info(opts)
      data
    end

    # List Service Alerts
    # List service alert messages for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [ListServiceAlertsRequest] :list_service_alerts_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(ListServiceAlerts200Response, Integer, Hash)>] ListServiceAlerts200Response data, response status code and response headers
    def list_service_alerts_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.list_service_alerts ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/alerts'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'list_service_alerts_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'ListServiceAlerts200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.list_service_alerts",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#list_service_alerts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Set Database User Access Control
    # Configure access control settings for a Managed Database user (Redis engine type only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @option opts [SetDatabaseUserAclRequest] :set_database_user_acl_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabaseUser202Response]
    def set_database_user_acl(database_id, username, opts = {})
      data, _status_code, _headers = set_database_user_acl_with_http_info(database_id, username, opts)
      data
    end

    # Set Database User Access Control
    # Configure access control settings for a Managed Database user (Redis engine type only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @option opts [SetDatabaseUserAclRequest] :set_database_user_acl_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabaseUser202Response, Integer, Hash)>] CreateDatabaseUser202Response data, response status code and response headers
    def set_database_user_acl_with_http_info(database_id, username, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.set_database_user_acl ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.set_database_user_acl"
      end
      # verify the required parameter 'username' is set
      if @api_client.config.client_side_validation && username.nil?
        fail ArgumentError, "Missing the required parameter 'username' when calling ManagedDatabasesApi.set_database_user_acl"
      end
      # resource path
      local_var_path = '/databases/{database-id}/users/{username}/access-control'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'username' + '}', CGI.escape(username.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'set_database_user_acl_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabaseUser202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.set_database_user_acl",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#set_database_user_acl\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start Maintenance Updates
    # Start maintenance updates for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [StartMaintenanceUpdates200Response]
    def start_maintenance_updates(opts = {})
      data, _status_code, _headers = start_maintenance_updates_with_http_info(opts)
      data
    end

    # Start Maintenance Updates
    # Start maintenance updates for the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(StartMaintenanceUpdates200Response, Integer, Hash)>] StartMaintenanceUpdates200Response data, response status code and response headers
    def start_maintenance_updates_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.start_maintenance_updates ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/maintenance'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'StartMaintenanceUpdates200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.start_maintenance_updates",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#start_maintenance_updates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start Version Upgrade
    # Start a version upgrade for the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @option opts [StartVersionUpgradeRequest] :start_version_upgrade_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [StartVersionUpgrade200Response]
    def start_version_upgrade(opts = {})
      data, _status_code, _headers = start_version_upgrade_with_http_info(opts)
      data
    end

    # Start Version Upgrade
    # Start a version upgrade for the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @option opts [StartVersionUpgradeRequest] :start_version_upgrade_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(StartVersionUpgrade200Response, Integer, Hash)>] StartVersionUpgrade200Response data, response status code and response headers
    def start_version_upgrade_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.start_version_upgrade ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/version-upgrade'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'start_version_upgrade_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'StartVersionUpgrade200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.start_version_upgrade",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#start_version_upgrade\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Advanced Options
    # Updates an advanced configuration option for the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateAdvancedOptionsRequest] :update_advanced_options_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [ListAdvancedOptions200Response]
    def update_advanced_options(opts = {})
      data, _status_code, _headers = update_advanced_options_with_http_info(opts)
      data
    end

    # Update Advanced Options
    # Updates an advanced configuration option for the Managed Database (PostgreSQL engine types only).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateAdvancedOptionsRequest] :update_advanced_options_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(ListAdvancedOptions200Response, Integer, Hash)>] ListAdvancedOptions200Response data, response status code and response headers
    def update_advanced_options_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.update_advanced_options ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/advanced-options'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_advanced_options_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'ListAdvancedOptions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.update_advanced_options",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#update_advanced_options\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Connection Pool
    # Update connection-pool information within a Managed Database (PostgreSQL engine types only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param pool_name [String] The [connection pool name](#operation/list-connection-pools).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateConnectionPoolRequest] :update_connection_pool_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateConnectionPool202Response]
    def update_connection_pool(database_id, pool_name, opts = {})
      data, _status_code, _headers = update_connection_pool_with_http_info(database_id, pool_name, opts)
      data
    end

    # Update Connection Pool
    # Update connection-pool information within a Managed Database (PostgreSQL engine types only).
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param pool_name [String] The [connection pool name](#operation/list-connection-pools).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateConnectionPoolRequest] :update_connection_pool_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateConnectionPool202Response, Integer, Hash)>] CreateConnectionPool202Response data, response status code and response headers
    def update_connection_pool_with_http_info(database_id, pool_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.update_connection_pool ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.update_connection_pool"
      end
      # verify the required parameter 'pool_name' is set
      if @api_client.config.client_side_validation && pool_name.nil?
        fail ArgumentError, "Missing the required parameter 'pool_name' when calling ManagedDatabasesApi.update_connection_pool"
      end
      # resource path
      local_var_path = '/databases/{database-id}/connection-pools/{pool-name}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'pool-name' + '}', CGI.escape(pool_name.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_connection_pool_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateConnectionPool202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.update_connection_pool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#update_connection_pool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Managed Database
    # Update information for a Managed Database. All attributes are optional. If not set, the attributes will retain their original values.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateDatabaseRequest] :update_database_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabase202Response]
    def update_database(database_id, opts = {})
      data, _status_code, _headers = update_database_with_http_info(database_id, opts)
      data
    end

    # Update Managed Database
    # Update information for a Managed Database. All attributes are optional. If not set, the attributes will retain their original values.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateDatabaseRequest] :update_database_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabase202Response, Integer, Hash)>] CreateDatabase202Response data, response status code and response headers
    def update_database_with_http_info(database_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.update_database ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.update_database"
      end
      # resource path
      local_var_path = '/databases/{database-id}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_database_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabase202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.update_database",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#update_database\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Database User
    # Update database user information within a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateDatabaseUserRequest] :update_database_user_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateDatabaseUser202Response]
    def update_database_user(database_id, username, opts = {})
      data, _status_code, _headers = update_database_user_with_http_info(database_id, username, opts)
      data
    end

    # Update Database User
    # Update database user information within a Managed Database.
    # @param database_id [String] The [Managed Database ID](#operation/list-databases).
    # @param username [String] The [database user](#operation/list-database-users).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateDatabaseUserRequest] :update_database_user_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateDatabaseUser202Response, Integer, Hash)>] CreateDatabaseUser202Response data, response status code and response headers
    def update_database_user_with_http_info(database_id, username, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.update_database_user ...'
      end
      # verify the required parameter 'database_id' is set
      if @api_client.config.client_side_validation && database_id.nil?
        fail ArgumentError, "Missing the required parameter 'database_id' when calling ManagedDatabasesApi.update_database_user"
      end
      # verify the required parameter 'username' is set
      if @api_client.config.client_side_validation && username.nil?
        fail ArgumentError, "Missing the required parameter 'username' when calling ManagedDatabasesApi.update_database_user"
      end
      # resource path
      local_var_path = '/databases/{database-id}/users/{username}'.sub('{' + 'database-id' + '}', CGI.escape(database_id.to_s)).sub('{' + 'username' + '}', CGI.escape(username.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_database_user_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateDatabaseUser202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.update_database_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#update_database_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Migration Status
    # View the status of a migration attached to the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [ViewMigrationStatus200Response]
    def view_migration_status(opts = {})
      data, _status_code, _headers = view_migration_status_with_http_info(opts)
      data
    end

    # Get Migration Status
    # View the status of a migration attached to the Managed Database.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ViewMigrationStatus200Response, Integer, Hash)>] ViewMigrationStatus200Response data, response status code and response headers
    def view_migration_status_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagedDatabasesApi.view_migration_status ...'
      end
      # resource path
      local_var_path = '/databases/{database-id}/migration'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ViewMigrationStatus200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ManagedDatabasesApi.view_migration_status",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagedDatabasesApi#view_migration_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
