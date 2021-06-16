.PHONY: all
all: cmds

GOLANGCI_LINT_VERSION := 1.39.0
GOIMPORTS_VERSION := 0.1.2

GOBIN ?= $(HOME)/bin
GO_GET := GO111MODULE=on GOBIN=$(GOBIN) go get

.PHONY: cmds
cmds:
	$(GO_GET) github.com/golangci/golangci-lint/cmd/golangci-lint@v$(GOLANGCI_LINT_VERSION)
	$(GO_GET) golang.org/x/tools/cmd/goimports@v$(GOIMPORTS_VERSION)
