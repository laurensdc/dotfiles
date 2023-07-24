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

" Composite escape - not necessary as we're using the better_escape plugin
" inoremap jl <esc> 

" D when text is selected won't send text to paste register
vnoremap D "_d

" Blinking cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Automatically install vim-plug for plugin management
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin stuff
call plug#begin('~/.vim/plugged')

" call :PlugInstall after adding one
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'jdhao/better-escape.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme onedark
let g:better_escape_shortcut = 'jl'
let g:better_escape_interval = 100

