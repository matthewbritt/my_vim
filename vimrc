execute pathogen#infect()
"My preferences
filetype plugin indent on
syntax on
colorscheme jay
set colorcolumn=120
set number
let mapleader=","
map <leader>s :source ~/.vimrc<CR>
"Optimisations for moar power!
filetype indent on
set nowrap
set tabstop=4
set autoindent
"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"Search customisations
set hlsearch
"Show matching parentheses
set showmatch
