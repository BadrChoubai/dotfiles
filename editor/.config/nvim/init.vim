" =============================================================================
"
call plug#begin('~/.config/nvim/plugged')

    " Neovim lsp Plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tjdevries/nlua.nvim'
    Plug 'tjdevries/lsp_extensions.nvim'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'reedes/vim-pencil'
    Plug 'mattn/emmet-vim'

    " telescope requirements...
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/telescope.nvim'

    Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    Plug 'chriskempson/base16-vim'
    Plug 'phanviet/vim-monokai-pro'

call plug#end()

" =============================================================================
" # Editor settings
" =============================================================================
"

set termguicolors
colorscheme gruvbox
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

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType rust let b:coc_root_patterns = ['Cargo.toml', '.git']
autocmd InsertEnter,InsertLeave * set cul!

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

lua require'nvim_lsp'.jdtls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.html.setup{ on_attach=require'completion'.on_attach }

