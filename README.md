# Friday's challenge
### Problem Statement 1
This solution uses the latest version of official AWS module "s3-bucket" (https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest)

Some values are located in `values.tvvars` file. 
So please do not forget to include them.

```terraform plan -var-file="values.tfvars"```

Unfortunately I do now have an access to AWS cloud this is why `main.tf` has the following block:
```  
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "my_access_key"
  secret_key                  = "my_secret_key"
```
Please be free to remove it.

### Problem Statement 2
The provided Helm chart deploys a HelloWord application from my Docker Hub repository.
This chart also creates a Kubernetes service (NodePort) and an Ingress controller (Nginx).