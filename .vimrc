" Enable mouse support
set mouse=a
" Enable syntax
syntax on
" Enable line number
set number
" Enable line relative numbers
set relativenumber
" Highlight current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=black
" Enable highlight search pattern
set hlsearch
" Enable smartcase search sensitivity
set ignorecase
set smartcase
" Show matching part of pairs [] {} and ()
set showmatch
" Enable color themes
if !has('gui_running')
  set t_Co=256
endif
" Enable true colors support
set termguicolors
" When scrolling keep an offset of the begin and end of the file
set scrolloff=8
set sidescrolloff=8

set nocompatible
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Havin longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
set signcolumn=yes
"endif

"set nowrap

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Allow gf to open non-existing files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Open the current file in the default program
noremap <leader>x :!open %<cr><cr>

" Toggle off search highlight when ESC is pressed
noremap <esc> :noh<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

call plug#begin('~/.vim/plugins')

"source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/onedark.vim
source ~/.config/nvim/plugins/vim-polyglot.vim
source ~/.config/nvim/plugins/nerdtree.vim
"source ~/.config/nvim/plugins/vim-prettier.vim
source ~/.config/nvim/plugins/eslint.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/ctrlp.vim
source ~/.config/nvim/plugins/vim-go.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/vim-gitgutter.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/floaterm.vim

call plug#end()
doautocmd User PlugLoaded
