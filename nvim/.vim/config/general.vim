set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set mouse=a

set nu
set nobackup
set smartcase

syntax on

set noswapfile

"自动缩进与C语言风格缩进
set autoindent
set cindent

"缩进宽度
set softtabstop=4
set shiftwidth=4
set tabstop=4

set laststatus=2
set t_Co=256

set guifont=Monaco\ for\ Powerline:h12

" 新建.h文件时自动加上#ifdef #endif等
function! s:insert_gates()
        let gatename = "__" . substitute(toupper(expand("%:t")), "\\.", "_", "g") . "__"
        execute "normal! i#ifndef " . gatename
        execute "normal! o#define " . gatename .
        execute "normal! o"
        execute "normal! Go#endif /* " . gatename . " */"
        normal! k
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set autoread

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000
set hidden

" Delete buffer
map <F5> <ESC>:bp<CR>
" Switch to next buffer
map <F6> <ESC>:bn<CR>
" Switch to previous buffer
map <S-F5> <ESC>:bd<CR>

map <F10> <ESC>:qall!<CR>

"colorscheme jelleybeans
"colorscheme tender
colorscheme dracula
"colorscheme candyman
"colorscheme lucario

let g:airline_theme = 'tender'

set cursorline
"set cursorcolumn

set expandtab
filetype plugin on

set clipboard=unnamed

set backspace=indent,eol,start
set shell=/usr/bin/zsh
