=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.2.0-SNAPSHOT

=end

require 'date'
require 'time'

module VultrRuby
  # Managed Database information.
  class Database
    # A unique ID for the Managed Database.
    attr_accessor :id

    # The date this database was created.
    attr_accessor :date_created

    # The name of the Managed Database plan.
    attr_accessor :plan

    # The size of the disk in GB (excluded for Redis engine types).
    attr_accessor :plan_disk

    # The amount of RAM in MB.
    attr_accessor :plan_ram

    # Number of vCPUs.
    attr_accessor :plan_vcpus

    # Number of replica nodes.
    attr_accessor :plan_replicas

    # The [Region id](#operation/list-regions) where the Managed Database is located.
    attr_accessor :region

    # The database engine type (MySQL, PostgreSQL, FerretDB + PostgreSQL, Redis).
    attr_accessor :database_engine

    # The version number of the database engine in use.
    attr_accessor :database_engine_version

    # The ID of the [VPC Network](#operation/get-vpc) attached to the Managed Database.
    attr_accessor :vpc_id

    # The current status.  * Rebuilding * Rebalancing * Running
    attr_accessor :status

    # The user-supplied label for this managed database.
    attr_accessor :label

    # The user-supplied tag for this managed database.
    attr_accessor :tag

    # The default database name.
    attr_accessor :dbname

    attr_accessor :ferretdb_credentials

    # The public hostname for database connections, or private hostname if this managed database is attached to a VPC network.
    attr_accessor :host

    # The public hostname for database connections. Only visible when the managed database is attached to a VPC network.
    attr_accessor :public_host

    # The default user configured on creation.
    attr_accessor :user

    # The default user's secure password generated on creation.
    attr_accessor :password

    # The assigned port for connecting to the Managed Database.
    attr_accessor :port

    # The chosen date of week for routine maintenance updates.
    attr_accessor :maintenance_dow

    # The chosen hour for routine maintenance updates.
    attr_accessor :maintenance_time

    # The date for the latest backup stored on the Managed Database.
    attr_accessor :latest_backup

    # A list of trusted IP addresses for connecting to this Managed Database (in CIDR notation).
    attr_accessor :trusted_ips

    # A list names of enabled SQL Modes for MySQL engine types only.
    attr_accessor :mysql_sql_modes

    # Configuration value for requiring table primary keys for MySQL engine types only.
    attr_accessor :mysql_require_primary_key

    # Configuration value for slow query logging on the Managed Database for MySQL engine types only.
    attr_accessor :mysql_slow_query_log

    # The number of seconds to denote a slow query when logging is enabled for MySQL engine types only.
    attr_accessor :mysql_long_query_time

    # A list of objects containing names and versions (when applicable) of available extensions for PostgreSQL engine types only.
    attr_accessor :pg_available_extensions

    # The current configured data eviction policy for Redis engine types only.
    attr_accessor :redis_eviction_policy

    # The configured time zone of the Managed Database in TZ database format.
    attr_accessor :cluster_time_zone

    # A list of database objects containing details for all attached read-only replica nodes.
    attr_accessor :read_replicas

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'date_created' => :'date_created',
        :'plan' => :'plan',
        :'plan_disk' => :'plan_disk',
        :'plan_ram' => :'plan_ram',
        :'plan_vcpus' => :'plan_vcpus',
        :'plan_replicas' => :'plan_replicas',
        :'region' => :'region',
        :'database_engine' => :'database_engine',
        :'database_engine_version' => :'database_engine_version',
        :'vpc_id' => :'vpc_id',
        :'status' => :'status',
        :'label' => :'label',
        :'tag' => :'tag',
        :'dbname' => :'dbname',
        :'ferretdb_credentials' => :'ferretdb_credentials',
        :'host' => :'host',
        :'public_host' => :'public_host',
        :'user' => :'user',
        :'password' => :'password',
        :'port' => :'port',
        :'maintenance_dow' => :'maintenance_dow',
        :'maintenance_time' => :'maintenance_time',
        :'latest_backup' => :'latest_backup',
        :'trusted_ips' => :'trusted_ips',
        :'mysql_sql_modes' => :'mysql_sql_modes',
        :'mysql_require_primary_key' => :'mysql_require_primary_key',
        :'mysql_slow_query_log' => :'mysql_slow_query_log',
        :'mysql_long_query_time' => :'mysql_long_query_time',
        :'pg_available_extensions' => :'pg_available_extensions',
        :'redis_eviction_policy' => :'redis_eviction_policy',
        :'cluster_time_zone' => :'cluster_time_zone',
        :'read_replicas' => :'read_replicas'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'date_created' => :'String',
        :'plan' => :'String',
        :'plan_disk' => :'Integer',
        :'plan_ram' => :'Integer',
        :'plan_vcpus' => :'Integer',
        :'plan_replicas' => :'Integer',
        :'region' => :'String',
        :'database_engine' => :'String',
        :'database_engine_version' => :'String',
        :'vpc_id' => :'String',
        :'status' => :'String',
        :'label' => :'String',
        :'tag' => :'String',
        :'dbname' => :'String',
        :'ferretdb_credentials' => :'DatabaseFerretdbCredentials',
        :'host' => :'String',
        :'public_host' => :'String',
        :'user' => :'String',
        :'password' => :'String',
        :'port' => :'String',
        :'maintenance_dow' => :'String',
        :'maintenance_time' => :'String',
        :'latest_backup' => :'String',
        :'trusted_ips' => :'Array<String>',
        :'mysql_sql_modes' => :'Array<String>',
        :'mysql_require_primary_key' => :'Boolean',
        :'mysql_slow_query_log' => :'Boolean',
        :'mysql_long_query_time' => :'Integer',
        :'pg_available_extensions' => :'Array<Object>',
        :'redis_eviction_policy' => :'String',
        :'cluster_time_zone' => :'String',
        :'read_replicas' => :'Array<Object>'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `VultrRuby::Database` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VultrRuby::Database`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'date_created')
        self.date_created = attributes[:'date_created']
      end

      if attributes.key?(:'plan')
        self.plan = attributes[:'plan']
      end

      if attributes.key?(:'plan_disk')
        self.plan_disk = attributes[:'plan_disk']
      end

      if attributes.key?(:'plan_ram')
        self.plan_ram = attributes[:'plan_ram']
      end

      if attributes.key?(:'plan_vcpus')
        self.plan_vcpus = attributes[:'plan_vcpus']
      end

      if attributes.key?(:'plan_replicas')
        self.plan_replicas = attributes[:'plan_replicas']
      end

      if attributes.key?(:'region')
        self.region = attributes[:'region']
      end

      if attributes.key?(:'database_engine')
        self.database_engine = attributes[:'database_engine']
      end

      if attributes.key?(:'database_engine_version')
        self.database_engine_version = attributes[:'database_engine_version']
      end

      if attributes.key?(:'vpc_id')
        self.vpc_id = attributes[:'vpc_id']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'label')
        self.label = attributes[:'label']
      end

      if attributes.key?(:'tag')
        self.tag = attributes[:'tag']
      end

      if attributes.key?(:'dbname')
        self.dbname = attributes[:'dbname']
      end

      if attributes.key?(:'ferretdb_credentials')
        self.ferretdb_credentials = attributes[:'ferretdb_credentials']
      end

      if attributes.key?(:'host')
        self.host = attributes[:'host']
      end

      if attributes.key?(:'public_host')
        self.public_host = attributes[:'public_host']
      end

      if attributes.key?(:'user')
        self.user = attributes[:'user']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'port')
        self.port = attributes[:'port']
      end

      if attributes.key?(:'maintenance_dow')
        self.maintenance_dow = attributes[:'maintenance_dow']
      end

      if attributes.key?(:'maintenance_time')
        self.maintenance_time = attributes[:'maintenance_time']
      end

      if attributes.key?(:'latest_backup')
        self.latest_backup = attributes[:'latest_backup']
      end

      if attributes.key?(:'trusted_ips')
        if (value = attributes[:'trusted_ips']).is_a?(Array)
          self.trusted_ips = value
        end
      end

      if attributes.key?(:'mysql_sql_modes')
        if (value = attributes[:'mysql_sql_modes']).is_a?(Array)
          self.mysql_sql_modes = value
        end
      end

      if attributes.key?(:'mysql_require_primary_key')
        self.mysql_require_primary_key = attributes[:'mysql_require_primary_key']
      end

      if attributes.key?(:'mysql_slow_query_log')
        self.mysql_slow_query_log = attributes[:'mysql_slow_query_log']
      end

      if attributes.key?(:'mysql_long_query_time')
        self.mysql_long_query_time = attributes[:'mysql_long_query_time']
      end

      if attributes.key?(:'pg_available_extensions')
        if (value = attributes[:'pg_available_extensions']).is_a?(Array)
          self.pg_available_extensions = value
        end
      end

      if attributes.key?(:'redis_eviction_policy')
        self.redis_eviction_policy = attributes[:'redis_eviction_policy']
      end

      if attributes.key?(:'cluster_time_zone')
        self.cluster_time_zone = attributes[:'cluster_time_zone']
      end

      if attributes.key?(:'read_replicas')
        if (value = attributes[:'read_replicas']).is_a?(Array)
          self.read_replicas = value
        end
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
          id == o.id &&
          date_created == o.date_created &&
          plan == o.plan &&
          plan_disk == o.plan_disk &&
          plan_ram == o.plan_ram &&
          plan_vcpus == o.plan_vcpus &&
          plan_replicas == o.plan_replicas &&
          region == o.region &&
          database_engine == o.database_engine &&
          database_engine_version == o.database_engine_version &&
          vpc_id == o.vpc_id &&
          status == o.status &&
          label == o.label &&
          tag == o.tag &&
          dbname == o.dbname &&
          ferretdb_credentials == o.ferretdb_credentials &&
          host == o.host &&
          public_host == o.public_host &&
          user == o.user &&
          password == o.password &&
          port == o.port &&
          maintenance_dow == o.maintenance_dow &&
          maintenance_time == o.maintenance_time &&
          latest_backup == o.latest_backup &&
          trusted_ips == o.trusted_ips &&
          mysql_sql_modes == o.mysql_sql_modes &&
          mysql_require_primary_key == o.mysql_require_primary_key &&
          mysql_slow_query_log == o.mysql_slow_query_log &&
          mysql_long_query_time == o.mysql_long_query_time &&
          pg_available_extensions == o.pg_available_extensions &&
          redis_eviction_policy == o.redis_eviction_policy &&
          cluster_time_zone == o.cluster_time_zone &&
          read_replicas == o.read_replicas
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, date_created, plan, plan_disk, plan_ram, plan_vcpus, plan_replicas, region, database_engine, database_engine_version, vpc_id, status, label, tag, dbname, ferretdb_credentials, host, public_host, user, password, port, maintenance_dow, maintenance_time, latest_backup, trusted_ips, mysql_sql_modes, mysql_require_primary_key, mysql_slow_query_log, mysql_long_query_time, pg_available_extensions, redis_eviction_policy, cluster_time_zone, read_replicas].hash
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
