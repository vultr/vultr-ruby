=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.2.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for VultRuby::ManagedDatabasesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ManagedDatabasesApi' do
  before do
    # run before each test
    @api_instance = VultRuby::ManagedDatabasesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ManagedDatabasesApi' do
    it 'should create an instance of ManagedDatabasesApi' do
      expect(@api_instance).to be_instance_of(VultRuby::ManagedDatabasesApi)
    end
  end

  # unit tests for create_connection_pool
  # Create Connection Pool
  # Create a new connection pool within the Managed Database (PostgreSQL engine types only).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateConnectionPoolRequest] :create_connection_pool_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateConnectionPool202Response]
  describe 'create_connection_pool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_database
  # Create Managed Database
  # Create a new Managed Database in a &#x60;region&#x60; with the desired &#x60;plan&#x60;. Supply optional attributes as desired.
  # @param [Hash] opts the optional parameters
  # @option opts [CreateDatabaseRequest] :create_database_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabase202Response]
  describe 'create_database test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_database_db
  # Create Logical Database
  # Create a new logical database within the Managed Database (MySQL and PostgreSQL only).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateDatabaseDbRequest] :create_database_db_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabaseDb202Response]
  describe 'create_database_db test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_database_user
  # Create Database User
  # Create a new database user within the Managed Database. Supply optional attributes as desired.
  # @param [Hash] opts the optional parameters
  # @option opts [CreateDatabaseUserRequest] :create_database_user_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabaseUser202Response]
  describe 'create_database_user test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for database_add_read_replica
  # Add Read-Only Replica
  # Create a read-only replica node for the Managed Database.
  # @param [Hash] opts the optional parameters
  # @option opts [DatabaseAddReadReplicaRequest] :database_add_read_replica_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabase202Response]
  describe 'database_add_read_replica test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for database_detach_migration
  # Detach Migration
  # Detach a migration from the Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'database_detach_migration test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for database_fork
  # Fork Managed Database
  # Fork a Managed Database to a new subscription from a backup.
  # @param [Hash] opts the optional parameters
  # @option opts [DatabaseForkRequest] :database_fork_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabase202Response]
  describe 'database_fork test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for database_promote_read_replica
  # Promote Read-Only Replica
  # Promote a read-only replica node to its own primary Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'database_promote_read_replica test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for database_restore_from_backup
  # Restore from Backup
  # Create a new Managed Database from a backup.
  # @param [Hash] opts the optional parameters
  # @option opts [DatabaseRestoreFromBackupRequest] :database_restore_from_backup_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabase202Response]
  describe 'database_restore_from_backup test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for database_start_migration
  # Start Migration
  # Start a migration to the Managed Database.
  # @param [Hash] opts the optional parameters
  # @option opts [DatabaseStartMigrationRequest] :database_start_migration_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [ViewMigrationStatus200Response]
  describe 'database_start_migration test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_connection_pool
  # Delete Connection Pool
  # Delete a connection pool within a Managed Database (PostgreSQL engine types only).
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param pool_name The [connection pool name](#operation/list-connection-pools).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_connection_pool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_database
  # Delete Managed Database
  # Delete a Managed Database.
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_database test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_database_db
  # Delete Logical Database
  # Delete a logical database within a Managed Database (MySQL and PostgreSQL only).
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param db_name The [logical database name](#operation/list-database-dbs).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_database_db test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_database_user
  # Delete Database User
  # Delete a database user within a Managed Database.
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param username The [database user](#operation/list-database-users).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_database_user test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_backup_information
  # Get Backup Information
  # Get backup information for the Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [GetBackupInformation200Response]
  describe 'get_backup_information test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_connection_pool
  # Get Connection Pool
  # Get information about a Managed Database connection pool (PostgreSQL engine types only).
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param pool_name The [connection pool name](#operation/list-connection-pools).
  # @param [Hash] opts the optional parameters
  # @return [CreateConnectionPool202Response]
  describe 'get_connection_pool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_database
  # Get Managed Database
  # Get information about a Managed Database.
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param [Hash] opts the optional parameters
  # @return [CreateDatabase202Response]
  describe 'get_database test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_database_db
  # Get Logical Database
  # Get information about a logical database within a Managed Database (MySQL and PostgreSQL only).
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param db_name The [logical database name](#operation/list-database-dbs).
  # @param [Hash] opts the optional parameters
  # @return [CreateDatabaseDb202Response]
  describe 'get_database_db test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_database_usage
  # Get Database Usage Information
  # Get disk, memory, and vCPU usage information for a Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [GetDatabaseUsage200Response]
  describe 'get_database_usage test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_database_user
  # Get Database User
  # Get information about a Managed Database user.
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param username The [database user](#operation/list-database-users).
  # @param [Hash] opts the optional parameters
  # @return [CreateDatabaseUser202Response]
  describe 'get_database_user test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_advanced_options
  # List Advanced Options
  # List all configured and available advanced options for the Managed Database (PostgreSQL engine types only).
  # @param [Hash] opts the optional parameters
  # @return [ListAdvancedOptions200Response]
  describe 'list_advanced_options test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_available_versions
  # List Available Versions
  # List all available version upgrades within the Managed Database (PostgreSQL engine types only).
  # @param [Hash] opts the optional parameters
  # @return [ListAvailableVersions200Response]
  describe 'list_available_versions test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_connection_pools
  # List Connection Pools
  # List all connection pools within the Managed Database (PostgreSQL engine types only).
  # @param [Hash] opts the optional parameters
  # @return [ListConnectionPools200Response]
  describe 'list_connection_pools test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_database_dbs
  # List Logical Databases
  # List all logical databases within the Managed Database (MySQL and PostgreSQL only).
  # @param [Hash] opts the optional parameters
  # @return [ListDatabaseDbs200Response]
  describe 'list_database_dbs test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_database_plans
  # List Managed Database Plans
  # List all Managed Databases plans.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :engine Filter by engine type  * &#x60;mysql&#x60; * &#x60;pg&#x60; * &#x60;redis&#x60;.
  # @option opts [Integer] :nodes Filter by number of nodes.
  # @option opts [String] :region Filter by [Region id](#operation/list-regions).
  # @return [ListDatabasePlans200Response]
  describe 'list_database_plans test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_database_users
  # List Database Users
  # List all database users within the Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [ListDatabaseUsers200Response]
  describe 'list_database_users test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_databases
  # List Managed Databases
  # List all Managed Databases in your account.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :label Filter by label.
  # @option opts [String] :tag Filter by specific tag.
  # @option opts [String] :region Filter by [Region id](#operation/list-regions).
  # @return [ListDatabases200Response]
  describe 'list_databases test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_maintenance_updates
  # List Maintenance Updates
  # List all available version upgrades within the Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [ListMaintenanceUpdates200Response]
  describe 'list_maintenance_updates test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_service_alerts
  # List Service Alerts
  # List service alert messages for the Managed Database.
  # @param [Hash] opts the optional parameters
  # @option opts [ListServiceAlertsRequest] :list_service_alerts_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [ListServiceAlerts200Response]
  describe 'list_service_alerts test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for set_database_user_acl
  # Set Database User Access Control
  # Configure access control settings for a Managed Database user (Redis engine type only).
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param username The [database user](#operation/list-database-users).
  # @param [Hash] opts the optional parameters
  # @option opts [SetDatabaseUserAclRequest] :set_database_user_acl_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabaseUser202Response]
  describe 'set_database_user_acl test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_maintenance_updates
  # Start Maintenance Updates
  # Start maintenance updates for the Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [StartMaintenanceUpdates200Response]
  describe 'start_maintenance_updates test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_version_upgrade
  # Start Version Upgrade
  # Start a version upgrade for the Managed Database (PostgreSQL engine types only).
  # @param [Hash] opts the optional parameters
  # @option opts [StartVersionUpgradeRequest] :start_version_upgrade_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [StartVersionUpgrade200Response]
  describe 'start_version_upgrade test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_advanced_options
  # Update Advanced Options
  # Updates an advanced configuration option for the Managed Database (PostgreSQL engine types only).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateAdvancedOptionsRequest] :update_advanced_options_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [ListAdvancedOptions200Response]
  describe 'update_advanced_options test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_connection_pool
  # Update Connection Pool
  # Update connection-pool information within a Managed Database (PostgreSQL engine types only).
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param pool_name The [connection pool name](#operation/list-connection-pools).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateConnectionPoolRequest] :update_connection_pool_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateConnectionPool202Response]
  describe 'update_connection_pool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_database
  # Update Managed Database
  # Update information for a Managed Database. All attributes are optional. If not set, the attributes will retain their original values.
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateDatabaseRequest] :update_database_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabase202Response]
  describe 'update_database test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_database_user
  # Update Database User
  # Update database user information within a Managed Database.
  # @param database_id The [Managed Database ID](#operation/list-databases).
  # @param username The [database user](#operation/list-database-users).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateDatabaseUserRequest] :update_database_user_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateDatabaseUser202Response]
  describe 'update_database_user test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for view_migration_status
  # Get Migration Status
  # View the status of a migration attached to the Managed Database.
  # @param [Hash] opts the optional parameters
  # @return [ViewMigrationStatus200Response]
  describe 'view_migration_status test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
