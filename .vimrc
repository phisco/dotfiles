if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

set nocompatible

syntax on
filetype on
filetype plugin indent on
let mapleader = ','
nnoremap <C-L> :nohl<CR><C-L>

set autoindent
set backspace=indent,eol,start	
set colorcolumn=100
set expandtab
set hlsearch
set ignorecase
set incsearch
set linebreak
set nobackup
set noswapfile
set nottimeout
set relativenumber
set pastetoggle=<C-V>
set ruler
set shiftwidth=4
set showbreak=+++ 
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set textwidth=100
set title
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000	
set undoreload=10000
set visualbell
set wildmenu
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
map <leader>Q :q! <return>
map <leader>W :w !sudo tee %<return>
map <leader>q :q <return>
map <leader>w :w <return>
vnoremap <leader>s :sort<return>
call plug#begin()
Plug 'Raimondi/delimitMate'
"Plug 'ervandew/supertab'
Plug 'mhinz/vim-startify'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
