provider "vault" {

}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "my-role"
}

provider "aws" {
    region = "${data.vault_aws_access_credentials.creds.region}"
    access_key = "${data.vault_aws_access_credentials.creds.access_key}"
    secret_key = "${data.vault_aws_access_credentials.creds.secret_key}"
  
}

# resource "vault_aws_secret_backend" "aws" {
 
#   path       = "${var.name}-path"

#   default_lease_ttl_seconds = "120"
#   max_lease_ttl_seconds     = "240"
# }


# resource "vault_aws_secret_backend_role" "admin" {
#   backend         = vault_aws_secret_backend.aws.path
#   name            = "${var.name}-role"
#   credential_type = "iam_user"

#   policy_document = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "iam:*", "ec2:*"
#       ],
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }





output "access_key" {
    value = data.vault_aws_access_credentials.creds.access_key
  
}

output "secret_key" {

    value = data.vault_aws_access_credentials.creds.secret_key
  
}

output "lease_id" {

    value = data.vault_aws_access_credentials.creds.lease_id
  
}
