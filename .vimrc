call plug#begin('~/.vim/plugged')
  Plug 'tidalcycles/vim-tidal'
  Plug 'preservim/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


set exrc
set secure
set nu
set rnu
set sts=2 
set ts=2
set sw=2
set hlsearch
set incsearch
set paste
