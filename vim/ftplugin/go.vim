let b:ale_linters = ['golangci-lint', 'gofmt', 'govet']
let b:ale_fixers = ['gofmt', 'goimports']

augroup auto_ctags
	autocmd!
	autocmd BufWritePost * silent! !ctags -R &
augroup END
