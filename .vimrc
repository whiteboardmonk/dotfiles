" use utf-8 without BOM
set encoding=utf-8 nobomb
" enable pathogen
call pathogen#infect()
" Make Vim more useful
set nocompatible
" use the `solarized` colorscheme
colorscheme solarized
" and make it use the dark background
set background=dark
" set the leader key
let mapleader=" "
" enable a ruler at the bottom of the screen
set ruler
" always display the status line
set laststatus=2
" set up the statusline
"set statusline=%n:\ %F\ %m%r%h%p\ %{synIDattr(synID(line('.'),col('.'),1),'name')}\ %=Line\ %l/%L,\ Column\ %c\ %y
" set up the statusline
set statusline=
	" buffer number
	set statusline+=[%n]
	" file in buffer
	set statusline+=\ %F
	" modified or not
	set statusline+=\ [%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
	" readonly flag
	set statusline+=%r
	" helpfile or not
	set statusline+=%h
	" right align
	set statusline+=%=
	" Line number
	set statusline+=Line\ %l/%L,
	" Column number
	set statusline+=\ Column\ %c
	" Filetype
	set statusline+=\ %y
" enable commandline completion when in command mode
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" use 2 chars whitespace for tabs
set tabstop=2
set softtabstop=2
" use proper tabs
set noexpandtab
" enable loading the indent file for specific file types
filetype plugin indent on
" how many colums >> and << indent
set shiftwidth=2
" indent by multiples of shiftwidth
set shiftround
" don't wrap long lines
set nowrap
" enable autoindenting
set autoindent
" hightlight the line the cursor is on
set cursorline
" show invisibles
set list
" use ▸ followed by spaces to show tabs, use ¬ for end of line characters
set listchars=tab:⇥\ ,eol:¬,nbsp:_,trail:•,extends:»,precedes:«
" use the solarized 256 colorscheme
let g:solarized_termcolors=256
" use line numbers
set number
" use a 5 char wide gutter for linenumbers
set numberwidth=5
" use relative line numbers by default if possible
if exists("+relativenumber")
	set relativenumber
endif
" start scrolling 4 lines before hitting the bottom of the screen
set scrolloff=4
" Ignore case when searching, but be smart about it
set ignorecase
set smartcase
" Highlight search results as they are found
set incsearch
" Highlight the last found search results
set hlsearch
" Clear last found search results
nnoremap <leader><space> :nohlsearch<CR>
" Show commands as they are typed
set showcmd
" Show the current mode
set showmode
" Don't show the intro message when starting Vim
set shortmess=atI
" Automatic commands
if has("autocmd")
" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Remove trailing whitespace before saving
	autocmd BufWritePre * :%s/\s\+$//e
	" Override automatic comment insertion on enter in insert mode and when
	" using o/O in command mode
	autocmd FileType * set formatoptions-=r formatoptions-=o
	if exists("&relativenumber")
		autocmd BufReadPost * set relativenumber
	endif
	" reload .vimrc when updating it
	autocmd BufWritePost .vimrc nested source %
endif
" force using h/j/k/l instead of arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" disable arrow keys in insert mode to force a switch to command mode
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
" disable arrow keys in command mode to really unlearn using arrow keys
cnoremap <Left> <C-u>:echoe "Use C-w, C-u, or C-b"<CR>
cnoremap <Right> <C-u>:echoe "Use C-e"<CR>
cnoremap <Up> <C-u>:echoe "Use C-p"<CR>
cnoremap <Down> <C-u>:echoe "Use C-n"<CR>
" enable syntax highlighting
syntax on
