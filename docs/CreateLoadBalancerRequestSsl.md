# VultrRuby::CreateLoadBalancerRequestSsl

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **private_key** | **String** | The private key. | [optional] |
| **certificate** | **String** | The SSL certificate. | [optional] |
| **chain** | **String** | The certificate chain. | [optional] |
| **private_key_b64** | **String** | The private key base64 encoded. (Base64 encoded values should not be used alongside with non-Base64 encoded values) | [optional] |
| **certificate_b64** | **String** | The SSL certificate base64 encoded. (Base64 encoded values should not be used alongside with non-Base64 encoded values) | [optional] |
| **chain_b64** | **String** | The certificate chain base64 encoded. (Base64 encoded values should not be used alongside with non-Base64 encoded values) | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateLoadBalancerRequestSsl.new(
  private_key: null,
  certificate: null,
  chain: null,
  private_key_b64: null,
  certificate_b64: null,
  chain_b64: null
)
```

