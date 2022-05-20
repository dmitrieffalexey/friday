# Friday's challenge
### Problem Statement 1
This solution uses the latest version of official AWS module "s3-bucket" (https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest)

Some values are located in `values.tvvars` file. 
So please do not forget to include them.

```terraform plan -var-file="values.tfvars"```

There are life cycle polices in `values.tvvars` file. This is a list of polices ordered in the same way as the list of buckets name. 
So the policy with index `i` will be assigned to the bucket with the same index. 
For example bucket `crazy-berlin-weather-hourly` gets policy `0` etc. 

Unfortunately I do not have an access to AWS cloud this is why `main.tf` has the following block:
```  
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "my_access_key"
  secret_key                  = "my_secret_key"
```
Please be free to remove it.

### Possible Improvement (ToDo)
I have just found that I can split bucket name to `bucket_name_prefix` and `bucket_name_suffix`
Set `bucket_name_prefix = "crazy-berlin-weather-"` and  `bucket_name_suffix` as a list of suffixes `bucket_name_suffix = ["hourly", "daily", "weekly"]`.
The list of lifecycle policies should be changed to `map of objects` where indexes are `bucket_name_suffix`.
In this case I would be able to forget about this order restriction in the list of lifecycle policies.  

### Problem Statement 2
The provided Helm chart deploys a HelloWorld application from my Docker Hub repository.
This chart also creates a Kubernetes service (NodePort) and an Ingress controller (Nginx).

The high availability and fault tolerant are managed by the following parameters:
- Replica count is more than 2 
- Deployment strategy is `RollingUpdate`
- `RollingUpdate` parameters such as `maxUnavailable` and `maxSurge`

Yes of course I can implement a Blue-Green deployment for this application but 
I think this is a bit out of scope of this challenge :) 