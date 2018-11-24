if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

set nocompatible
filetype on
filetype plugin indent on
let mapleader = ','
map <leader>Q :q! <return>
map <leader>W :w !sudo tee %<return>
map <leader>q :q <return>
map <leader>w :w <return>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-L> <C-W><C-L>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
set autoindent
set backspace=indent,eol,start	
set colorcolumn=100
set expandtab
set hlsearch
set ignorecase
set incsearch
set linebreak
set mouse=a
set nobackup
set noswapfile
set nottimeout
set pastetoggle=<C-B>
set relativenumber
set ruler
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title
set undodir=$HOME/.vim/undo
set undofile
set undolevels=1000	
set undoreload=10000
set visualbell
set wildmenu
syntax on
vnoremap <leader>s :sort<return>
let g:airline#extensions#tabline#enabled = 1
"set hidden

nnoremap <C-N> :bnext<CR>
nnoremap <C-M> :bprev<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>D :bdelete!<CR>

"==================== NerdTree ====================
" For toggling
"let NERDTreeShowHidden=1
noremap - :NERDTreeFind<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"=============================================
call plug#begin()
"Plug 'Valloric/YouCompleteMe'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ervandew/supertab'
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-vinegar'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'christianrondeau/vim-base64'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mhinz/vim-startify'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
"Plug 'tyrannicaltoucan/vim-quantum'
call plug#end()

set background=dark
"colorscheme PaperColor

"let g:airline_theme='quantum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:deoplete#enable_at_startup = 1
set rtp+=~/.fzf
set list
noremap <C-P> :FZF<cr>
let g:indentLine_enabled = 1
set foldmethod=indent
set foldlevelstart=20
let g:diminactive_use_syntax = 1
