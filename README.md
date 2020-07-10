# slurm-playbook

Ansible playbook for Slurm

## Single server installation

Create an inventory file, copying structure of:

`inventories/vagrant-single.yml`

Run the playbook:

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/vagrant-single.yml playbook.yml
```

## Cluster installation

Create an inventory file, copying structure of:

`inventories/vagrant-cluster.yml`


## Note about Vagrant build

!WARNING!: on a Vagrant cluster, you might need to edit the `/etc/hosts` files on each server.

The playbook attempts to do this for you.

!WARNING!: There is a task that uses `rsync` to synchronise the munge key file
from the slurm server to the slurm worker nodes. This will only work is passwordless
SSH is possible from the slurm server to the worker nodes.

## Test Slurm is working

You can test slurm is working on the master or worker nodes, using:

```
squeue # to view the queue

sbatch /root/hostname.sh # to run a job
sbatch /root/hostname.sh ; sbatch /root/hostname.sh  # to run a couple more jobs

squeue # to see if they are running/completing
```

## Test with vagrant file

Use the `Vagrantfile` to setup up a cluster:

```
$ vagrant up
$ ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u vagrant --private-key=~/.vagrant.d/insecure_private_key -i inventories/vagrant-cluster setup-vagrant-hosts-playbook.yml
$ ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u vagrant --private-key=~/.vagrant.d/insecure_private_key -i inventories/vagrant-cluster playbook-cluster.yml
$ vagrant ssh slurmmaster
```
