set autoindent
set backspace=2
set encoding=utf-8
set expandtab
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2 
set nocompatible
set nowrap
set number
set ruler
set showmatch
set shiftwidth=4
set showcmd
set softtabstop=4
set tabstop=4
set textwidth=80
syntax on 
highlight Normal guibg=lightyellow
filetype plugin on
map <F6> :set paste!<bar>set nopaste?<CR>
map <F7> :w<bar>!echo compiling...;javac %;echo running...;java %:t:r<CR>
map <Insert> <RightMouse>
