all:
	ansible-playbook -i localhost site.yml

lint:
	ansible-lint

.PHONY: all lint
