let b:ale_linters = ['golangci-lint', 'gofmt', 'govet']
let b:ale_fixers = ['gofmt', 'goimports']

autocmd BufWritePost * silent! !ctags -R &
