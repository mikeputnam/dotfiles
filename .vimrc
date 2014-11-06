au BufReadPost *.app set syntax=python
let g:netrw_liststyle=3
set autoindent
set backspace=2
set clipboard=unnamedplus
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
syntax on 
colorscheme darkblue
set background=dark
highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta
highlight Normal guibg=lightyellow
filetype plugin on
map <F5> :set nonumber!<bar>set number?<CR>
map <F6> :set paste!<bar>set nopaste?<CR>
"write-make-run This evaluates to the basename of the current file --> %:t:r
map <F7> <Esc>:w<bar>!echo compiling...;make clean;make;echo running...;./%:t:r<CR>
imap <F7> <Esc>:w<bar>!echo compiling...;make clean;make;echo running...;./%:t:r<CR>
map <Insert> <RightMouse>
