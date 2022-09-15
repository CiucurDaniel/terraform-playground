# terraform-playground

* modules - reusable Terraform modules
* live - instantiation of the modules
* (TODO) state-bucket - bucket with the state of the account
* (TODO) refactor in order to use Terragrunt for DRY code

Instantiations will have state which will be stored in a bucket. In turn if I create the bucket with Terraform, that
will also generate state. Therefore, that will be stored locally on my computer and will not be pushed to git.

## run code

```
aws configure  [here provide the secret_key and secret_key]

terraform init

terraform plan

terraform apply

terraform destroy
```

## Requirements

```
λ terraform --version
Terraform v1.2.2
on windows_amd64
```

```
terragrunt
[...]
VERSION:
   v0.37.1
```   

```
λ aws --version
aws-cli/2.7.32 Python/3.9.11 Windows/10 exe/AMD64 prompt/off
```

## HINTS!

[Install AWS Cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) 
