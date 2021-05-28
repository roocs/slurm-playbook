# slurm-playbook

Ansible playbook for Slurm

## Single server installation

Create an inventory file, copying structure of:

`cp inventories/vagrant-single.yml custom.yml`

Run the playbook:

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i custom.yml playbook.yml
```

## Cluster installation

Create an inventory file, copying structure of:

`inventories/vagrant-cluster.yml`


## Note about Vagrant build

!WARNING!: on a Vagrant cluster, you might need to edit the `/etc/hosts` files on each server.

The playbook attempts to do this for you.


## Test Slurm is working

You can test slurm is working on the master or worker nodes, using:

```
squeue # to view the queue

sbatch /root/hostname.sh # to run a job
sbatch /root/hostname.sh ; sbatch /root/hostname.sh  # to run a couple more jobs

squeue # to see if they are running/completing
```

## Test with vagrant file

## Vagrant with cluster

Use the `Vagrantfile` to setup up a cluster:

```
$ vagrant up
$ ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u vagrant --private-key=~/.vagrant.d/insecure_private_key -i inventories/vagrant-cluster.yml playbook.yml
$ vagrant ssh slurmmaster
```

### Vagrant with single node

Use the `Vagrantfile` to setup up a single node on `slurmmaster`:

```
$ vagrant up slurmmaster
$ ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u vagrant --private-key=~/.vagrant.d/insecure_private_key -i inventories/vagrant-single.yml playbook.yml
$ vagrant ssh slurmmaster
```

## Firewall changes required

If the firewall is not automatically opened in iptables then you will need these rules:

 1. On the master node:

```
# Slurm ports
-A INPUT                                       -p tcp -m multiport --dports 6817,6818      -j ACCEPT
```

 2. On the worker nodes:

```
# Slurm ports
-A INPUT                                       -p tcp -m multiport --dports 6817,6818      -j ACCEPT
```
