.PHONY: all
all: cmds

GOLANGCI_LINT_VERSION := 1.40.1
GOIMPORTS_VERSION := 0.1.2

.PHONY: cmds
cmds:
	go get github.com/golangci/golangci-lint/cmd/golangci-lint@v$(GOLANGCI_LINT_VERSION)
	go get golang.org/x/tools/cmd/goimports@v$(GOIMPORTS_VERSION)
