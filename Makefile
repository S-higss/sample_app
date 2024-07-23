.DEFAULT_GOAL := help

.PHONY: push-all
push-all:		## push all changes under current directory
	@git add .
	@git commit -m "commit all changes"
	@git push origin HEAD

.PHONY: test
test:	## automating test execution with Guard
	@bundle exec guard

.PHONY: history
history:        ## commit and push all changes to repo with commit message
	@echo "Enter your commit message:"; \
	read message; \
	git add .; \
	git commit -m "$$message"; \
	git push origin HEAD

.PHONY: help
help:	## show commands
	@grep -E '^[[:alnum:]_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
