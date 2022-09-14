# terraform-playground

* modules - reusable Terraform modules
* live - instantiation of the modules
* (TODO) state-bucket - bucket with the state of the account
* (TODO) refactor in order to use Terragrunt for DRY code

Instantiations will have state which will be stored in a bucket.
In turn if I create the bucket with Terraform, that will also generate state. Therefore, that will be stored locally on my computer and will not be pushed to git.


