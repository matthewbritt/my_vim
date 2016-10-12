execute pathogen#infect()
"My preferences
filetype plugin on
syntax on
colorscheme jay
set colorcolumn=120
set number
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Optimisations for moar power!
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent
"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"Search customisations
set hlsearch
"Show matching parentheses
set showmatch
noremap <Leader>r :CommandTFlush<CR>
set backspace=indent,eol,start
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"
" " Lightline enable
set laststatus=2
set noshowmode

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\ 	'left': [
	\				[
	\					'mode', 'paste'
	\				],
	\   	      	[
	\					'fugitive', 'filename'
	\				]
	\			]
	\ },
	\ 'component_function': {
	\   'fugitive': 'LightLineFugitive',
	\   'readonly': 'LightLineReadOnly',
	\   'modified': 'LightLineModified',
	\   'filename': 'LightLineFilename'
	\ },
	\ 'separator': {
	\   'left': '⮀',
	\	'right': '⮂'
	\ },
	\ 'subseparator': {
	\	'left': '⮁',
	\	'right': '⮃'
	\ }
\}

function! LightLineReadOnly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return "⭤"
	else
		return ""
	endif
endfunction

function! LightLineModified()
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

function! LightLineFugitive()
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
