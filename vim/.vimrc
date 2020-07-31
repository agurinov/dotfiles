" Plugins installed via https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'morhetz/gruvbox'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Configuration for vim and plugins
set encoding=utf-8

set laststatus=2
set tabstop=4

filetype plugin indent on
syntax on

let NERDTreeShowHidden=1

" Coloscheme settings
set t_Co=256
colorscheme gruvbox
set background=dark

" Line numbers
set number
set ruler
set numberwidth=5

set modifiable
set wrap
set linebreak
set autoindent
set smartindent

" Display extra whitespaces
set list listchars=tab:»·,space:·,trail:·,nbsp:·,eol:¬

set showcmd

" Search area
set incsearch
set hlsearch
set ignorecase

set nobackup
set noswapfile

set hidden

" Key bindings mappings
map <C-\> :NERDTreeToggle<CR>
