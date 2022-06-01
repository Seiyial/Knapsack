syntax enable

call plug#begin('~/.vim/plugged')
" use :PlugInstall<enter> within vim to install
Plug 'ayu-theme/ayu-vim'
Plug 'sts10/vim-pink-moon'
Plug 'sheerun/vim-polyglot'
call plug#end()

set termguicolors
set t_Co=256
set number
set bs=2

set tabstop=3
set softtabstop=0 noexpandtab
set shiftwidth=3

let ayucolor="mirage"
colorscheme ayu
set background=dark
"colorscheme pink-moon