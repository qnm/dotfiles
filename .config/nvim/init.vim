filetype off                   " required!
set modeline

call plug#begin('~/.config/nvim/plugged')

" My Plugins here:
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'

" Add plugins to &runtimepath
call plug#end()

" Layout settings
set number " turn on line numbers

" retain selection after increasing/decreasing indent
vmap > >gv
vmap < <gv

" solarized
syntax enable
set background=dark
colorscheme solarized

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" 80-col highlighting
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80
