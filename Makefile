.PHONY: macos provision vagrant release destroy

SHELL := /bin/bash

CURR_HASH := $(shell echo "$$(git rev-list --pretty=%h --max-count=1 HEAD | grep -v ^commit)")

macos:
	@echo "Provisioning macOS box"
	./macOS_provision.sh

vagrant:
	vagrant up

provision:
	vagrant provision

release:
	git tag -a $(VERSION) -m "Release version: $(VERSION)"
	git push origin $(VERSION)

destroy:
	vagrant destroy

