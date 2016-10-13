"My preferences
filetype plugin on
syntax on
colorscheme jay
set colorcolumn=120
set number
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set cursorline
"Optimisations for moar power!
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"Search customisations
set hlsearch
set incsearch
set ignorecase
"Show matching parentheses
set showmatch
noremap <Leader>r :CommandTFlush<CR>
set backspace=indent,eol,start
