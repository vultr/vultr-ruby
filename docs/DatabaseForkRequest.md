# VultRuby::DatabaseForkRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label** | **String** | A user-supplied label for this Managed Database. |  |
| **region** | **String** | The [Region id](#operation/list-regions) where the Managed Database is located. |  |
| **plan** | **String** | The [Plan id](#operation/list-database-plans) to use when deploying this Managed Database. |  |
| **vpc_id** | **String** | The [VPC id](#operation/list-vpcs) to use when deploying this Managed Database. It can also be set to &#x60;new&#x60; to configure a new VPC network with this deployment. | [optional] |
| **type** | **String** | The type of backup restoration to use for this Managed Database. * &#x60;pitr&#x60;: Point-in-time recovery * &#x60;basebackup&#x60;: Latest backup (default if omitted) | [optional] |
| **date** | **String** | The [backup date](#operation/get-backup-information) to use when restoring the Managed Database in YYYY-MM-DD date format. Required for &#x60;pitr&#x60; type requests. | [optional] |
| **time** | **String** | The [backup time](#operation/get-backup-information) to use when restoring the Managed Database in HH-MM-SS time format (24-hour UTC). Required for &#x60;pitr&#x60; type requests. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseForkRequest.new(
  label: null,
  region: null,
  plan: null,
  vpc_id: null,
  type: null,
  date: null,
  time: null
)
```

