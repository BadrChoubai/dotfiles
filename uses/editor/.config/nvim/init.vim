call plug#begin('~/.config/nvim/plugged')

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-markdown'
    Plug 'sheerun/vim-polyglot'
    Plug 'mattn/emmet-vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
    Plug 'bmeneg/coc-perl', {'do': 'yarn install && yarn build'}

    Plug 'vim-scripts/cSyntaxAfter'
    Plug 'reedes/vim-pencil'

    Plug 'morhetz/gruvbox'
    Plug 'phanviet/vim-monokai-pro'

call plug#end()

" =============================================================================
" # Editor settings
" =============================================================================
"

set termguicolors
colorscheme monokai_pro 
set background=dark
filetype plugin on
syntax on

set number
set relativenumber
syntax on
autocmd! FileType c,cpp,java,php call CSyntaxAfter()

set hidden

set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set updatetime=50
set encoding=utf-8

set noshowmode
set nowrap
set nojoinspaces

" Sane splits
set splitright
set splitbelow

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nocompatible

" ==============|
" # Key mappings|
" ==============|
"

let mapleader = " "

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H> 

set nocompatible
filetype plugin on       " may already be in your .vimrc

" ==============|
" # autocmd     |
" ==============|
"

augroup pencil
  autocmd!
  autocmd FileType text         call pencil#init()
augroup END
