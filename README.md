# slurm-playbook

Ansible playbook for Slurm

## Single server instructions

Create an inventory file, copying structure of:

`inventories/vagrant-single-server`

Create a host_vars file named the same as the IP of the single server, e.g.:

`host_vars/192.168.50.44`

Run the playbook:

`ansible-playbook -i inventories/vagrant-single-server playbook.yml`
