let b:ale_linters = ['golangci-lint', 'gofmt', 'govet']
let b:ale_fixers = ['gofmt', 'goimports']

snippet anon
abbr fn := func() { ... }
	${1:fn} := func() {
		${0}
	}
