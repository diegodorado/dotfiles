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
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'
  " Visuals
  Plug 'netsgnut/arctheme.vim'
  Plug 'vim-airline/vim-airline'
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

"autocmd FocusLost * silent! wa " Automatically save file
set scrolloff=5 " Keep 5 lines below and above the cursor

nnoremap H ^
nnoremap L $
nnoremap ; :
nmap <Leader>s :write<Enter>
nmap <Leader>r :redraw!<Enter>

"NERDtree setup
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

"ctrlp setup
"let g:ctrlp_use_caching=0
let g:ctrlp_prompt_mappings = {
\ 'PrtClearCache()': ['<c-r>'],
\}
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
