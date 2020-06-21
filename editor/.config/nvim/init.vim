" =============================================================================
"

call plug#begin('~/.config/nvim/plugged')

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 'leafgarland/typescript-vim'
	Plug 'bling/vim-airline'
    Plug 'vim-utils/vim-man'
    Plug 'sheerun/vim-polyglot'

    Plug 'chriskempson/base16-vim'
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

set number
set relativenumber
syntax on

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

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" =============================================================================
"" # Keybinds
" =============================================================================
"

let mapleader= " "
set notimeout

let g:netrw_altv=1
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd h<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pv :wincmd h<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>


" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
