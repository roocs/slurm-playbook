[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![Build Status](https://travis-ci.org/grycap/ansible-role-munge.svg?branch=master)](https://travis-ci.org/grycap/ansible-role-munge)

Munge role
=======================

Install munge service in the front and wn nodes.

	# Type of node to install: front or wn
	munge_type_of_node: front
	# Password used to derive a munge key for authentication between the server and the workers
	munge_key_password: ''

Example Playbook
----------------
```
- hosts: server
  roles:
  - { role: 'grycap.munge', munge_type_of_node: 'front' }
```

Contributing to the role
========================
In order to keep the code clean, pushing changes to the master branch has been disabled. If you want to contribute, you have to create a branch, upload your changes and then create a pull request.  
Thanks
