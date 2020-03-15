" Mostly stolen from Yan Pritzer's most excellent Yadr (github.com/skwp/dotfiles)
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================
set number                      "Line numbers are good
set rnu
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader = "\<Space>"

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>

call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/plugged')
  Plug 'tidalcycles/vim-tidal'
  Plug 'preservim/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  " Visuals
  Plug 'netsgnut/arctheme.vim'
call plug#end()


" Display all matching files when we tab complete
set wildmenu


"set exrc
"set paste

syntax enable

colorscheme iceberg


" Better search
set hlsearch
set incsearch

" grep word under cursor
"nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

"set nowrap       "Don't wrap lines
"set linebreak    "Wrap lines at convenient points

" Move normally between wrapped lines
"nmap j gj
"nmap k gk

"autocmd FocusLost * silent! wa " Automatically save file

set scrolloff=5 " Keep 5 lines below and above the cursor

"set cursorline

nnoremap H ^
nnoremap L $
nnoremap ; :
nmap <Leader>s :write<Enter>
nmap <Leader>r :redraw!<Enter>

