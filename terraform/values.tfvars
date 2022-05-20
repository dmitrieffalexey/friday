// Values

bucket_names = ["crazy-berlin-weather-hourly", "crazy-berlin-weather-daily", "crazy-berlin-weather-weekly"]

s3_lifecycle_rules = [
  {
    id      = "hourly"
    enabled = true

    filter = {
      tags = {
        some    = "value"
        another = "value2"
      }
    }

    transition = [
      {
        days          = 30
        storage_class = "ONEZONE_IA"
      }, {
        days          = 60
        storage_class = "GLACIER"
      }
    ]
  },
  {
    id                                     = "daily"
    enabled                                = true
    abort_incomplete_multipart_upload_days = 7

    noncurrent_version_transition = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
      {
        days          = 60
        storage_class = "ONEZONE_IA"
      },
      {
        days          = 90
        storage_class = "GLACIER"
      },
    ]

    noncurrent_version_expiration = {
      days = 300
    }
  },
  {
    id      = "weekly"
    enabled = true

    filter = {
      prefix                   = "data"
      object_size_greater_than = 200000
      object_size_less_than    = 500000
      tags = {
        some    = "value"
        another = "value2"
      }
    }

    noncurrent_version_transition = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
    ]
    noncurrent_version_expiration = {
      days = 300
    }
  },
]
