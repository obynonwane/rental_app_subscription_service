# Routing Package 					= github.com/go-chi/chi/v5 (https://github.com/go-chi/chi)
# Routing Package Middleware 		= github.com/go-chi/chi/v5/middleware
# Routing Package Cors protection 	= github.com/go-chi/cors

# Set the binary name
SUBSCRIPTION_BINARY=subscriptionApp

# build_subscription_service: builds the subscription binary as a Linux executable
build_subscription_service: ## Build the subscription service binary
	@echo "Building subscription service binary..."
	@cd cmd/api && env GOOS=linux CGO_ENABLED=0 go build -o ../../$(SUBSCRIPTION_BINARY)
	@echo "Done!"

# Unit test: Run only unit tests
unit-test: ## Run only unit tests
	cd cmd/api && go test -v -tags='!integration' -count=1 ./...

# Integration test: Run only integration tests
integration-test: ## Run only integration tests
	cd cmd/api && go test -v -tags='integration' -count=1 ./...

# Full test: Run all tests (unit + integration)
test: ## Run all tests (unit + integration)
	cd cmd/api && go test -v -cover -count=1 ./...



# test-cache-clear: run test while clearing cache to see if any is failling
test-cache-clear: ## run test while clearing cache to see if any is failling
	cd cmd/api && go clean -testcache && go test -v -cover ./...

# generate-coverage-file: generate a detailed report for test coverage
generate-coverage-file: ## generate a detailed report for test coverage
	cd cmd/api && go test -coverprofile=coverage.out ./...

# read-coverage-file: read the generated coverage file in human readeable format on console
read-coverage-console: ## read the generated coverage file in human readeable format on console
	cd cmd/api && go tool cover -func=coverage.out

# read-coverage-html: read the generated coverage file in human readeable format on browser
read-coverage-html: ## read the generated coverage file in human readeable format on browser
	go tool cover -html=coverage.out


# help: list all make commands
help: ## Show this help
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z0-9_-]+:.*##/ { printf "  %-30s %s\n", $$1, $$2 } /^##@/ { printf "\n%s\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


# cd cmd/api && go test -v -run TestSignupHandler -cover ./...
