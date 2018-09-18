set number
inoremap jk <ESC>
let mapleader="<Space>"
" John Pham's .vimrc
" johnphammail@gmail.com | johnpham.net

" converts tabs to 2 spaces
set tabstop=2
" uses 2 spaces when editing with tabs
set softtabstop=2
" tabs are converted to spaces
set expandtab

" line numbering
set relativenumber
set number

" shows last command used
set showcmd

" draws a horizontal line on current line
"set cursorline

" load filetype-specific indent files
filetype plugin indent on

" visual autocomplete for commands
set wildmenu

" avoids unnecessary screen redraws
set lazyredraw

" search settings
set incsearch
set hlsearch

set showmatch
set shiftwidth=2
set smartindent
filetype indent on
filetype indent plugin on
set smarttab
set scrolloff=999

" folding stuff
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set encoding=utf8
set guifont=Hack:h12
nnoremap <space> za

let g:netrw_liststyle = 1
set clipboard=unnamedplus
set nocompatible " be iMproved, required
filetype off " required

" have vim remember last known position
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

call plug#begin('~/.vim/plugged')

Plug 'gabrielelana/vim-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'maralla/completor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/MatchTagAlways'
Plug 'Townk/vim-autoclose'
Plug 'itchyny/lightline.vim'
Plug 'othree/html5.vim'
Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'aperezdc/vim-template'

call plug#end()

syntax on
set cursorline
au BufRead,BufNewFile *.vue set filetype=html

set laststatus=2
set noshowmode
set hidden

"prettier
"run prettier before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.vue,*.less,*.graphql Prettier

let g:mta_filetypes = {
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'vue' : 1,
\}

" sets completor to complete on tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" ctrlp ignore node_modules folder
let g:ctrlp_custom_ignore = 'node_modules\|dist'

map <C-n> :NERDTreeToggle<CR>

let g:ft = ''
function! NERDCommenter_before()
if &ft == 'vue'
let g:ft = 'vue'
let stack = synstack(line('.'), col('.'))
if len(stack) > 0
let syn = synIDattr((stack)[0], 'name')
if len(syn) > 0
exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
endif
endif
endif
endfunction
function! NERDCommenter_after()
if g:ft == 'vue'
setf vue
let g:ft = ''
endif
endfunction

set ignorecase
set smartcase
set autoindent
