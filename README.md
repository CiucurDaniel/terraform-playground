# terraform-playground

modules - reusable Terraform modules
live - instantiation of the modules
state-bucket - bucket with the state of the account

Instantiations will have state which will be stored in a bucket.
In turn if I create the bucket with Terraform, that will also generate state. Therefore, that will be stored locally on my computer and will not be pushed to git.
#   t e r r a f o r m - p l a y g r o u n d  
 