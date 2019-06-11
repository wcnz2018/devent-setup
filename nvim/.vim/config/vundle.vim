set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorschemes
Plugin 'romainl/Apprentice'
Plugin 'zacanger/angr.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'itchyny/landscape.vim'
Plugin 'mhinz/vim-janah'

Plugin 'bfrg/vim-cpp-modern'

"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'sjl/gundo.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'fatih/vim-go'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
"Plugin 'jeaye/color_coded'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-colorscheme-switcher'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/denite.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'mhinz/vim-signify'
"Plugin 'tomtom/quickfixsigns_vim'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
"Plugin 'Yggdroot/indentLine'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'vim-scripts/mru.vim'
Plugin 'mhinz/vim-startify'

Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'

Plugin 'tpope/vim-endwise'
Plugin 'godlygeek/tabular'
Plugin 'gko/vim-coloresque'
"Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'kshenoy/vim-signature'  " visualize marks
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'junegunn/limelight.vim'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'vim-scripts/AnsiEsc.vim'

Plugin 'guns/xterm-color-table.vim'
Plugin 'suan/vim-instant-markdown'
"Plugin 'isnowfy/python-vim-instant-markdown'

Plugin 'ryanoasis/vim-devicons'  " icon stuff

Plugin 'rhysd/vim-clang-format'

Plugin 'kergoth/vim-bitbake'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
