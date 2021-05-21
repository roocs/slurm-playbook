.DEFAULT_GOAL := all

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  help        to print this help message. (Default)"
	@echo "  play        to run ansible playbook."
	@echo "  clean       to remove *all* files that are not controlled by 'git'. WARNING: use it *only* if you know what you do!"

.PHONY: play
play: roles
	echo "Installing PyWPS application with Ansible [all tasks] ..."
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -c local -i custom.yml playbook.yml


.PHONY: clean
clean:
	@echo "Cleaning ..."
	@git diff --quiet HEAD || echo "There are uncommited changes! Not doing 'git clean' ..."
	@-git clean -dfx -e *.bak -e .vagrant
