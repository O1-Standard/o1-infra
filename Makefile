.DEFAULT_GOAL:=help
SHELL:=/bin/bash

define run_ansible
	$(if $(1), echo Using playbook $(1), echo 'playbook is not defined'; exit 1)
	ANSIBLE_CONFIG=infrastructure/ansible.cfg ansible-playbook -i infrastructure/credentials/inventory.ini infrastructure/$1
endef

all: help

swarm-config: ## Run ansible playbook to deploy Swarm
	@$(call run_ansible,"main.yml")
	
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
