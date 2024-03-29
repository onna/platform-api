# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

# And add help text after each target name starting with '\#\#'
.PHONY: help
help: ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: spellcheck
spellcheck: ## Run spellcheck against spec
	@echo "$(YELLOW)==> Running spellcheck against OpenAPI spec $(RESET)"
	docker run --rm -v "$(CURDIR)"/spec:/app/spec -v "$(CURDIR)"/.cspell.json:/app/.cspell.json testthedocs/cspell:6.12.0 platform-api.yaml

