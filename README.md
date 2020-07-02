# slurm-playbook

Ansible playbook for Slurm

## Single server installation

Create an inventory file, copying structure of:

`inventories/vagrant-single-server`

Create a host_vars file named the same as the IP of the single server, e.g.:

`host_vars/192.168.50.44`

Run the playbook:

`ansible-playbook -i inventories/vagrant-single-server playbook.yml`

## Cluster installation

...

## Testing Slurm is working

You can test slurm is working with:

```
squeue # to view the queue
sbatch /root/hostname.sh # to run a job
squeue # to see if it is running
```

