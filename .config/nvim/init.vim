filetype off                   " required!
set modeline

call plug#begin('~/.config/nvim/plugged')

" My Plugins here:
Plug 'kien/ctrlp.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}

" Add plugins to &runtimepath
call plug#end()

" python host
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Layout settings
set number " turn on line numbers

" retain selection after increasing/decreasing indent
vmap > >gv
vmap < <gv

" theme
syntax enable
set background=dark
colorscheme solarized8
set termguicolors

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" 80-col highlighting
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80

" Identation
set autoindent " Copy indent from current line when starting a new line
set smarttab
set tabstop=2 " Number of space og a <Tab> character
set softtabstop=2
set shiftwidth=2 " Number of spaces use by autoindent
set expandtab " Pressing <Tab> puts spaces, and < and > for indenting uses psaces
