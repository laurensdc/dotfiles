" Line numbers
set number
set relativenumber

" Persistent undo
set undofile

" share system clipboard
set clipboard+=unnamedplus

" ignore case in search
set ignorecase

" :noh to remove the highlights

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'ThePrimeagen/vim-be-good'
Plug 'sheerun/vim-polyglot'
Plug 'navarasu/onedark.nvim'
" List ends here. Plugins become visible to Vim after this call.

call plug#end()

lua << EOF

require('onedark').setup {
    style = 'darker'
}

require('onedark').load()

EOF

