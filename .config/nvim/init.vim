" Basic settings

" Line numbers
set number
set relativenumber

" Persistent undo through file close
set undofile

" share system clipboard for yank & paste
set clipboard+=unnamedplus

" ignore case in search
set ignorecase
" :noh to remove the highlights

" modern vim only
set nocompatible

" syntax sugar plz
syntax on

" Plugin stuff
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'ThePrimeagen/vim-be-good'
Plug 'sheerun/vim-polyglot'
Plug 'navarasu/onedark.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Lua stuff 

lua << EOF

require('onedark').setup {
    style = 'darker'
}

require('onedark').load()

EOF

