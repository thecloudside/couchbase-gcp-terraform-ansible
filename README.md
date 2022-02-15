# How to Setup Couchbase Cluster Using the integration of Ansible and Terraform 

Setting up a couchbase cluster on GCE using Terraform and Ansible

## How to use this code in your workspace
1- Setup [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) in your workspace 

2- Setup [Terraform](https://www.terraform.io/downloads) in your workspace 

3- Clone this repo to your workspace 

4- Edit the `variables.tf` file and update variables as per your workspace 


## Usage

```bash
# Terraform need credentials to connect with GCP, export your credentials
export GOOGLE_APPLICATION_CREDENTIALS=<path_to_service_account_json_file>

# initialize terraform workspace 
terraform init

# let's see the plan 
terraform plan

# if plan is right as you want, then provision the infrastructure using
terraform apply --auto-approve
```


## For more information,, How to use this code see the below blog 

[How to setup couchbase cluster using the integration of Ansible and Terraform](https://blog.thecloudside.com/tutorial-setup-a-couchbase-cluster-on-gcp-using-terraform-and-ansible-4a52c9cd4bee)
