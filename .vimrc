syntax on
set number
syntax enable
colorscheme monokai

call plug#begin('~/.vim/plugged')
	" Use release branch (Recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-vetur'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-surround'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-fugitive'
	
call plug#end()

" =============================================================================
" # Completion
" =============================================================================
"

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" 'Smart' nevigation
nmap <silent> E <Plug>(coc-diagnostic-prev)
nmap <silent> W <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" =============================================================================
" # Editor settings
" =============================================================================
"

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set hidden

set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8

set noshowmode
set nowrap
set nojoinspaces

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

