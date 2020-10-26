" define a group 'vimrc' and initialize.
augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufReadPost *.app set syntax=python
autocmd vimrc BufReadPost *.ts set syntax=javascript
autocmd vimrc Filetype python map <F7> <Esc>:w<bar>vnew<bar>0read ! python #<CR>
autocmd vimrc Filetype sh map <F7> <Esc>:w<bar>vnew<bar>0read ! sh #<CR>
autocmd vimrc Filetype javascript map <F7> <Esc>:w<bar>vnew<bar>0read ! node #<CR>
autocmd vimrc Filetype yaml setlocal ts=2 sts=2 sw=2

let g:netrw_liststyle=3
set autoindent
set backspace=2
"set clipboard=unnamedplus
set encoding=utf-8
set expandtab
set nofixeol
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
set splitright
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
nnoremap  <F4> :set norelativenumber!<bar>set relativenumber?<CR>
inoremap  <F4> :set norelativenumber!<bar>set relativenumber?<CR>
nnoremap  <F5> :set nonumber!<bar>set number?<CR>
inoremap  <F5> :set nonumber!<bar>set number?<CR>
nnoremap  <F6> :set paste!<bar>set nopaste?<CR>
inoremap  <F6> :set paste!<bar>set nopaste?<CR>
nnoremap <F7> <Esc>:w<bar>!clear;make clean;make;./%:r<CR>
inoremap <F7> <Esc>:w<bar>!clear;make clean;make;./%:r<CR>
nnoremap <F8> :silent !make<CR>
inoremap <F8> :silent !make<CR>
nnoremap <F9> "=strftime("%FT%T%z")<CR>P
inoremap <F9> <C-R>=strftime("%FT%T%z")<CR>
map <Insert> <RightMouse>
"highlight trailing whitespace
match ErrorMsg '\s\+$'
"bind \-rtw to remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
