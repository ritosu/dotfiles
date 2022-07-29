syntax enable
filetype plugin indent on

" Plugin
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
call plug#end()

let g:airline_theme='luna'
let g:rustfmt_autosave=1
" end Plugin

set shell=/bin/zsh
set shiftwidth=4
set confirm

inoremap jj <ESC>
