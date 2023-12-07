# VultrRuby::CreateVpc2Request

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **region** | **String** | Create the VPC in this [Region id](#operation/list-regions). |  |
| **description** | **String** | A description of the VPC. &lt;/br&gt; Must be no longer than 255 characters and may include only letters, numbers, spaces, underscores and hyphens. | [optional] |
| **ip_type** | [**Enum**](Enum.md) | Accepted values: * &#x60;v4&#x60; | [optional] |
| **ip_block** | **String** | The VPC subnet IP address. For example: 10.99.0.0&lt;br&gt;&lt;span style&#x3D;\&quot;color: red\&quot;&gt;If a prefix_length is specified then ip_block is a required field.&lt;/span&gt; | [optional] |
| **prefix_length** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 24&lt;br&gt;&lt;span style&#x3D;\&quot;color: red\&quot;&gt;If an ip_block is specified then prefix_length is a required field.&lt;/span&gt; | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateVpc2Request.new(
  region: null,
  description: null,
  ip_type: null,
  ip_block: null,
  prefix_length: null
)
```

