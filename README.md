# DBRE Home Assignment
## Components
### Primary Database
PostgreSQL instance running on 12(or newer), that will serve as primary(master) server. Initialize it with pgbench schema.

### Standby Database
PostgreSQL instance that replicates primary database. Has a daily cron that generates a backup and uploads it to Cloud Storage.

### Cloud Storage
Cloud Storage bucket that will contain daily backups. Has a retention period of 15 days(after that backups are automatically deleted).

### Monitoring
Implement the following alerts on Google Cloud Monitoring.
- When CPU Usage > 90% on Primary Database.
- When Disk Usage > 85% on Primary Database.

## Prerequisites
### Clone the Repository
    git clone https://github.com/NihalMohammed79/dbre-home-assignment
    cd dbre-home-assignment

### Create a Google Cloud Project
Create a new [Google Cloud Project](https://console.cloud.google.com/welcome) and Enable the Compute Engine API for the Project.

### Create a Service Account and Download the Key in JSON Format
1. Go to IAM & Admin > Service Accounts.
2. Click on "Create Service Account".
3. Enter a name and click "Continue".
4. Grant the "Editor" role for the service account.
5. Click "Done".
6. Click on the service account you just created, then switch to the "Keys" tab.
7. Create a key in JSON format.
8. Copy the contents of the downloaded file into `files/credentials.json`.

### Install Terraform and Ansible
Install Terraform and Ansible by following their respective installation guides:
- [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Create SSH Keys
If not already done, create SSH keys using the following command:
    
    ssh-keygen -t rsa

Save the key in a file. For this project, we saved it in `/home/ubuntu/.ssh/id_rsa`. If you save it in another location, make sure to update the terraform.tfvars file.

**Note:** If you need to recreate the Terraform infrastructure, delete the entries created by them in `~/.ssh/known_hosts` to avoid identification mismatches with previous instances.

    ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R "machine_public_ip[0]"
    ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R "machine_public_ip[1]"

### Edit terraform.tfvars
Edit the `project_id`, `bucket_name`, `email_address`, and `service_account` fields in the `terraform.tfvars` file. The `bucket_name` needs to be globally unique. You can find the `service_account` in the `credentials.json` file. If needed, leave the rest of the fields unchanged.

### Terraform Commands
    terraform init
    terraform plan

Apply the configuration to create the resources:
    
    terraform apply

This command also creates two files: `files/gcp_hosts.ini` and `playbooks/variables.yml`.

### Connect to Compute Instances
After creating the Terraform infrastructure, connect to the instances with SSH to accept the prompt message asking if you trust their ECDSA key fingerprint. This is important because Ansible waits for user responses.

    ssh toggl_ssh_user@machine_public_ip[0]
    ssh toggl_ssh_user@machine_public_ip[1]

### Run Ansible Playbook
Making sure Ansible is installed, run the following command to configure the newly created Compute Instances.
    
    ansible-playbook -i ./files/gcp_hosts.ini ./playbooks/postgres_setup.yml

### Cleaning Up
To destroy all the created resources execute the following:
    
    terraform destroy

Confirm the operation and wait for the resources to be deleted.

Delete the service account by going to IAM & Admin > Service Accounts, click on the one created for the assignment. Select Actions > Delete and confirm it.