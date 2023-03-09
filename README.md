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
1. Go To IAM & Admin > Service Accounts
2. Click on "CREATE SERVICE ACCOUNT"
3. Enter a Name and Click Continue
4. Grant "Editor" Role for the Service Account
5. Click on Done
6. After creation, click on the Service Account. Then shift to the "Keys" Tab.
7. Create a Key in JSON Format
8. Copy the contents of the downloaded file into files > credentials.json

### Install Terraform and Ansible
Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

### Terraform Commands
    terraform init
    terraform plan

Apply the configuration to create the resources:
    terraform apply