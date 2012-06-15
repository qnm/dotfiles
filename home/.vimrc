filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nanotech/jellybeans.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'jpalardy/vim-slime'
Bundle 'mirell/vim-matchit'
Bundle 'leshill/vim-json'
Bundle 'hallison/vim-markdown'
Bundle 'itspriddle/vim-jquery'
"Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

let mapleader=","

"matchit
runtime macros/matchit.vim

" Indent with 2 spaces. Auto-indent.
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set smartindent
set expandtab

" Layout settings
set t_Co=256 
set number        " turn on line numbers
set cursorline    " highlight current line
set ruler         " show current line/column number in status line
set statusline=%F%m%r\ %y\ [%l/%L\ %v]

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" language plugins
syntax on
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://bitbucket.org/garybernhardt/dotfiles/src/tip/.vimrc)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" hide the menu
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" other settings
set scrolloff=3   " keep 3 lines when scrolling
set vb t_vb=      " turn off error beep/flash
set nobackup      " do not keep a backup file
set noswapfile    " do not make a swap file
set nowritebackup " I mean it do not make a bacukp file ever
set ttyfast        " smoother changes
set ls=2           " allways show status line

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" retain selection after increasing/decreasing indent
vmap > >gv
vmap < <gv

" copy/paste
map ,p "+gp
map ,y "+y

" Updating .vimrc
map ,ve :vs ~/.vimrc<cr>
map ,vu :source ~/.vimrc<cr>:exe ":echo 'vimrc reloaded'"<cr>

" Viewport controls
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-J> <C-W>j
map <C-K> <C-W>k

" Run current file
map ,rr :w<cr>:!ruby %<cr>
map ,rp :w<cr>:!python %<cr>

if has("gui_running")
  set guioptions-=T " hide toolbar

  " no scrollbars no matter what
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

" Custom filetypes
filetype on
au BufNewFile,BufRead *.ru set filetype=ruby
au BufRead,BufNewFile *.haml set filetype=haml 

" load theme
set background=dark
colorscheme jellybeans
