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

module VultRuby
  class CreateInstanceRequest
    # The [Region id](#operation/list-regions) where the Instance is located.
    attr_accessor :region

    # The [Plan id](#operation/list-plans) to use when deploying this instance.
    attr_accessor :plan

    # The [Operating System id](#operation/list-os) to use when deploying this instance.
    attr_accessor :os_id

    # The URL location of the iPXE chainloader.
    attr_accessor :ipxe_chain_url

    # The [ISO id](#operation/list-isos) to use when deploying this instance.
    attr_accessor :iso_id

    # The [Startup Script id](#operation/list-startup-scripts) to use when deploying this instance.
    attr_accessor :script_id

    # The [Snapshot id](#operation/list-snapshots) to use when deploying the instance.
    attr_accessor :snapshot_id

    # Enable IPv6.  * true
    attr_accessor :enable_ipv6

    # Don't set up a public IPv4 address when IPv6 is enabled. Will not do anything unless `enable_ipv6` is also `true`.  * true
    attr_accessor :disable_public_ipv4

    # Use `attach_vpc` instead. An array of [Private Network ids](#operation/list-networks) to attach to this Instance. This parameter takes precedence over `enable_private_network`. Please choose one parameter.
    attr_accessor :attach_private_network

    # An array of [VPC IDs](#operation/list-vpcs) to attach to this Instance. This parameter takes precedence over `enable_vpc`. Please choose one parameter.
    attr_accessor :attach_vpc

    # An array of [VPC IDs](#operation/list-vpc2) to attach to this Instance. This parameter takes precedence over `enable_vpc2`. Please choose one parameter.
    attr_accessor :attach_vpc2

    # A user-supplied label for this instance.
    attr_accessor :label

    # The [SSH Key id](#operation/list-ssh-keys) to install on this instance.
    attr_accessor :sshkey_id

    # Enable automatic backups for the instance.  * enabled * disabled
    attr_accessor :backups

    # The [Application id](#operation/list-applications) to use when deploying this instance.
    attr_accessor :app_id

    # The [Application image_id](#operation/list-applications) to use when deploying this instance.
    attr_accessor :image_id

    # The user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) to attach to this instance.
    attr_accessor :user_data

    # Enable DDoS protection (there is an additional charge for this).  * true * false
    attr_accessor :ddos_protection

    # Notify by email after deployment.  * true * false (default)
    attr_accessor :activation_email

    # The hostname to use when deploying this instance.
    attr_accessor :hostname

    # Use `tags` instead. The user-supplied tag.
    attr_accessor :tag

    # The [Firewall Group id](#operation/list-firewall-groups) to attach to this Instance.
    attr_accessor :firewall_group_id

    # ID of the floating IP to use as the main IP of this server.
    attr_accessor :reserved_ipv4

    # Use `enable_vpc` instead.  If `true`, private networking support will be added to the new server.  This parameter attaches a single network. When no network exists in the region, it will be automatically created.  If there are multiple private networks in the instance's region, use `attach_private_network` instead to specify a network.
    attr_accessor :enable_private_network

    # If `true`, VPC support will be added to the new server.  This parameter attaches a single VPC. When no VPC exists in the region, it will be automatically created.  If there are multiple VPCs in the instance's region, use `attach_vpc` instead to specify a network.
    attr_accessor :enable_vpc

    # If `true`, VPC 2.0 support will be added to the new server.  This parameter attaches a single VPC 2.0 network. When no VPC 2.0 network exists in the region, it will be automatically created.  If there are multiple VPC 2.0 networks in the instance's region, use `attach_vpc2` instead to specify a network.
    attr_accessor :enable_vpc2

    # Tags to apply to the instance
    attr_accessor :tags

    # Linux-only: The user scheme used for logging into this instance. By default, the \"root\" user is configured. Alternatively, a limited user with sudo permissions can be selected.  * root * limited
    attr_accessor :user_scheme

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'region' => :'region',
        :'plan' => :'plan',
        :'os_id' => :'os_id',
        :'ipxe_chain_url' => :'ipxe_chain_url',
        :'iso_id' => :'iso_id',
        :'script_id' => :'script_id',
        :'snapshot_id' => :'snapshot_id',
        :'enable_ipv6' => :'enable_ipv6',
        :'disable_public_ipv4' => :'disable_public_ipv4',
        :'attach_private_network' => :'attach_private_network',
        :'attach_vpc' => :'attach_vpc',
        :'attach_vpc2' => :'attach_vpc2',
        :'label' => :'label',
        :'sshkey_id' => :'sshkey_id',
        :'backups' => :'backups',
        :'app_id' => :'app_id',
        :'image_id' => :'image_id',
        :'user_data' => :'user_data',
        :'ddos_protection' => :'ddos_protection',
        :'activation_email' => :'activation_email',
        :'hostname' => :'hostname',
        :'tag' => :'tag',
        :'firewall_group_id' => :'firewall_group_id',
        :'reserved_ipv4' => :'reserved_ipv4',
        :'enable_private_network' => :'enable_private_network',
        :'enable_vpc' => :'enable_vpc',
        :'enable_vpc2' => :'enable_vpc2',
        :'tags' => :'tags',
        :'user_scheme' => :'user_scheme'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'region' => :'String',
        :'plan' => :'String',
        :'os_id' => :'Integer',
        :'ipxe_chain_url' => :'String',
        :'iso_id' => :'String',
        :'script_id' => :'String',
        :'snapshot_id' => :'String',
        :'enable_ipv6' => :'Boolean',
        :'disable_public_ipv4' => :'Boolean',
        :'attach_private_network' => :'Array<String>',
        :'attach_vpc' => :'Array<String>',
        :'attach_vpc2' => :'Array<String>',
        :'label' => :'String',
        :'sshkey_id' => :'Array<String>',
        :'backups' => :'String',
        :'app_id' => :'Integer',
        :'image_id' => :'String',
        :'user_data' => :'String',
        :'ddos_protection' => :'Boolean',
        :'activation_email' => :'Boolean',
        :'hostname' => :'String',
        :'tag' => :'String',
        :'firewall_group_id' => :'String',
        :'reserved_ipv4' => :'String',
        :'enable_private_network' => :'Boolean',
        :'enable_vpc' => :'Boolean',
        :'enable_vpc2' => :'Boolean',
        :'tags' => :'Array<String>',
        :'user_scheme' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `VultRuby::CreateInstanceRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VultRuby::CreateInstanceRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'region')
        self.region = attributes[:'region']
      else
        self.region = nil
      end

      if attributes.key?(:'plan')
        self.plan = attributes[:'plan']
      else
        self.plan = nil
      end

      if attributes.key?(:'os_id')
        self.os_id = attributes[:'os_id']
      end

      if attributes.key?(:'ipxe_chain_url')
        self.ipxe_chain_url = attributes[:'ipxe_chain_url']
      end

      if attributes.key?(:'iso_id')
        self.iso_id = attributes[:'iso_id']
      end

      if attributes.key?(:'script_id')
        self.script_id = attributes[:'script_id']
      end

      if attributes.key?(:'snapshot_id')
        self.snapshot_id = attributes[:'snapshot_id']
      end

      if attributes.key?(:'enable_ipv6')
        self.enable_ipv6 = attributes[:'enable_ipv6']
      end

      if attributes.key?(:'disable_public_ipv4')
        self.disable_public_ipv4 = attributes[:'disable_public_ipv4']
      end

      if attributes.key?(:'attach_private_network')
        if (value = attributes[:'attach_private_network']).is_a?(Array)
          self.attach_private_network = value
        end
      end

      if attributes.key?(:'attach_vpc')
        if (value = attributes[:'attach_vpc']).is_a?(Array)
          self.attach_vpc = value
        end
      end

      if attributes.key?(:'attach_vpc2')
        if (value = attributes[:'attach_vpc2']).is_a?(Array)
          self.attach_vpc2 = value
        end
      end

      if attributes.key?(:'label')
        self.label = attributes[:'label']
      end

      if attributes.key?(:'sshkey_id')
        if (value = attributes[:'sshkey_id']).is_a?(Array)
          self.sshkey_id = value
        end
      end

      if attributes.key?(:'backups')
        self.backups = attributes[:'backups']
      end

      if attributes.key?(:'app_id')
        self.app_id = attributes[:'app_id']
      end

      if attributes.key?(:'image_id')
        self.image_id = attributes[:'image_id']
      end

      if attributes.key?(:'user_data')
        self.user_data = attributes[:'user_data']
      end

      if attributes.key?(:'ddos_protection')
        self.ddos_protection = attributes[:'ddos_protection']
      end

      if attributes.key?(:'activation_email')
        self.activation_email = attributes[:'activation_email']
      end

      if attributes.key?(:'hostname')
        self.hostname = attributes[:'hostname']
      end

      if attributes.key?(:'tag')
        self.tag = attributes[:'tag']
      end

      if attributes.key?(:'firewall_group_id')
        self.firewall_group_id = attributes[:'firewall_group_id']
      end

      if attributes.key?(:'reserved_ipv4')
        self.reserved_ipv4 = attributes[:'reserved_ipv4']
      end

      if attributes.key?(:'enable_private_network')
        self.enable_private_network = attributes[:'enable_private_network']
      end

      if attributes.key?(:'enable_vpc')
        self.enable_vpc = attributes[:'enable_vpc']
      end

      if attributes.key?(:'enable_vpc2')
        self.enable_vpc2 = attributes[:'enable_vpc2']
      end

      if attributes.key?(:'tags')
        if (value = attributes[:'tags']).is_a?(Array)
          self.tags = value
        end
      end

      if attributes.key?(:'user_scheme')
        self.user_scheme = attributes[:'user_scheme']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @region.nil?
        invalid_properties.push('invalid value for "region", region cannot be nil.')
      end

      if @plan.nil?
        invalid_properties.push('invalid value for "plan", plan cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @region.nil?
      return false if @plan.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          region == o.region &&
          plan == o.plan &&
          os_id == o.os_id &&
          ipxe_chain_url == o.ipxe_chain_url &&
          iso_id == o.iso_id &&
          script_id == o.script_id &&
          snapshot_id == o.snapshot_id &&
          enable_ipv6 == o.enable_ipv6 &&
          disable_public_ipv4 == o.disable_public_ipv4 &&
          attach_private_network == o.attach_private_network &&
          attach_vpc == o.attach_vpc &&
          attach_vpc2 == o.attach_vpc2 &&
          label == o.label &&
          sshkey_id == o.sshkey_id &&
          backups == o.backups &&
          app_id == o.app_id &&
          image_id == o.image_id &&
          user_data == o.user_data &&
          ddos_protection == o.ddos_protection &&
          activation_email == o.activation_email &&
          hostname == o.hostname &&
          tag == o.tag &&
          firewall_group_id == o.firewall_group_id &&
          reserved_ipv4 == o.reserved_ipv4 &&
          enable_private_network == o.enable_private_network &&
          enable_vpc == o.enable_vpc &&
          enable_vpc2 == o.enable_vpc2 &&
          tags == o.tags &&
          user_scheme == o.user_scheme
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [region, plan, os_id, ipxe_chain_url, iso_id, script_id, snapshot_id, enable_ipv6, disable_public_ipv4, attach_private_network, attach_vpc, attach_vpc2, label, sshkey_id, backups, app_id, image_id, user_data, ddos_protection, activation_email, hostname, tag, firewall_group_id, reserved_ipv4, enable_private_network, enable_vpc, enable_vpc2, tags, user_scheme].hash
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
        klass = VultRuby.const_get(type)
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
