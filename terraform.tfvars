# Edit the `project_id`, `bucket_name`, `email_address`, `service_account` fields

project_id       = "spiritual-tiger-379914"
credentials_path = "./files/credentials.json"
region           = "europe-central2"
vpc_cidr         = "10.1.0.0/16"
access_ip        = "0.0.0.0/0" # Access from Everywhere
bucket_name      = "toggl-backup-bucket-79"
bucket_location  = "EU"
email_address    = "nihalmohammed79@gmail.com"
service_account  = "hello-102@spiritual-tiger-379914.iam.gserviceaccount.com"
instance_type    = "e2-medium"
instance_image   = "rocky-linux-cloud/rocky-linux-9"
ssh_user         = "toggl_ssh_user"
public_key_path  = "/home/ubuntu/.ssh/id_rsa.pub"