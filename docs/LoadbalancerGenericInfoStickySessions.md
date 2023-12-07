# VultRuby::LoadbalancerGenericInfoStickySessions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cookie_name** | **String** | The cookie name to make sticky. See [Load Balancer documentation](https://www.vultr.com/docs/vultr-load-balancers/#Load_Balancer_Configuration). | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::LoadbalancerGenericInfoStickySessions.new(
  cookie_name: null
)
```

