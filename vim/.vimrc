" Plugins installed via https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
map <C-\> :NERDTreeToggle<CR>
"map <C-]> :tabn<CR>
"map <C-[> :tabp<CR>

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'morhetz/gruvbox'
Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_max_line_indicator = "line"

Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save=1

call plug#end()

" Configuration for vim and plugins
set encoding=utf-8

set laststatus=2
set tabstop=4

filetype plugin indent on
syntax on

" Coloscheme settings
set t_Co=256
colorscheme gruvbox
set background=dark

" Line numbers
set number
set ruler
set numberwidth=5

" Disable arrow buttins
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

set nocompatible
set modifiable
set wrap
set linebreak
set autoindent
set smartindent

" Display extra whitespaces
set list listchars=tab:»\ ,space:·,trail:·,nbsp:·,eol:¬

set showcmd

" Search area
set incsearch
set hlsearch
set ignorecase

set nobackup
set noswapfile

set hidden

