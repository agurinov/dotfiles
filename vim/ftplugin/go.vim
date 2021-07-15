let b:ale_linters = ['gofmt']
let b:ale_fixers = ['gofmt', 'goimports']

augroup auto_ctags
	autocmd!
	autocmd BufWritePost * silent! !ctags -R &
augroup END
