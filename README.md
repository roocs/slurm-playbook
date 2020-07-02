# slurm-playbook

Ansible playbook for Slurm

## Single server installation

Create an inventory file, copying structure of:

`inventories/vagrant-single`

Create a host_vars file named the same as the IP of the single server, e.g.:

`host_vars/192.168.50.44`

Run the playbook:

`ansible-playbook -i inventories/vagrant-single playbook-single.yml`

## Cluster installation

Create an inventory file, copying structure of:

`inventories/vagrant-cluster`

Create a host_vars file named the same as the IP of the master server, e.g.:

`host_vars/192.168.50.44`

Edit the playbook `playbook-cluster.yml` to set the list of worker nodes, e.g.:

```
$ grep nodenames playbook-cluster.yml
      slurm_wn_nodenames: ['slurmbatch1', 'slurmbatch2']
      slurm_wn_nodenames: ['slurmbatch1', 'slurmbatch2']
```

!WARNING!: on a Vagrant cluster, you might need to edit the `/etc/hosts` files on each server.
If so, edit the playbook `setup-vagrant-hosts-playbook.yml` and run it as:

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/vagrant-cluster setup-vagrant-hosts-playbook.yml
```

Run the playbook, maybe with the environment variable at the start:

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/vagrant-single playbook-cluster.yml
```


...

## Testing Slurm is working

You can test slurm is working with:

```
squeue # to view the queue
sbatch /root/hostname.sh # to run a job
squeue # to see if it is running
```

