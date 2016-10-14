"My preferences
filetype plugin indent on
syntax on
colorscheme jay
set colorcolumn=120
set number
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set cursorline
"Optimisations for moar power!
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=2
set noexpandtab
set autoindent
set smartindent
set mouse=a
"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"Treat .json as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
"Search customisations
set hlsearch
set incsearch
set ignorecase
"Show matching parentheses
set showmatch

noremap <Leader>r :CommandTFlush<CR>
noremap <Leader>p :PlugInstall<CR>
set backspace=indent,eol,start
""
" Plugin settings
call plug#begin('~/.vim/plugged')
"" Lightline
Plug 'itchyny/lightline.vim'
"" Nerdcommenter
Plug 'scrooloose/nerdcommenter'
"" Fugitive
Plug 'git://github.com/tpope/vim-fugitive.git'
call plug#end()

"" Lightline config
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\ 	'left': [['mode', 'paste'], ['fugitive', 'filename']]
	\ },
	\ 'component_function': {
	\ 	'fugitive': 'LLFugitive',
	\ 	'readonly': 'LLReadOnly',
	\ 	'modified': 'LLModified',
	\ 	'filename': 'LLFilename'
	\ },
	\ 'separator': {
	\ 	'left': '⮀',
	\ 	'right': '⮂'
	\ },
	\ 'subseparator': {
	\ 	'left': '⮁',
	\ 	'right': '⮃'
	\ }
\}

function! LLReadOnly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return "⭤"
	else
		return ""
	endif
endfunction

function! LLModified()
	if &filetype == "help"
		return ""
	elseif &modified
		return "+"
	elseif &modifiable
		return ""
	else
		return ""
	endif
endfunction

function! LLFugitive()
	if exists("*fugitive#head")
		let branch = fugitive#head()
		return branch !=# '' ? '⭠ '.branch : ''
	endif
	return ''
endfunction

function! LightLineFilename()
	return ('' != LightLineReadOnly() ? LightLineReadOnly() . ' ' : '') .
	\ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
	\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
