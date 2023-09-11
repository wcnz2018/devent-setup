call plug#begin('~/.config/nvim/plugins')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'junkblocker/patchreview-vim'

Plug 'laniusone/kyotonight.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'ycm-core/YouCompleteMe'
Plug 'bfrg/vim-cpp-modern'
Plug 'bronson/vim-trailing-whitespace'
Plug 'APZelos/blamer.nvim'
Plug 'mhinz/vim-startify'
"Plug 'xolox/vim-session'
"Plug 'airblade/vim-gitgutter'
"Plug 'tveskag/nvim-blame-line'
"Plug 'tpope/vim-fugitive'
"Plug 'EdenEast/nightfox.nvim'
Plug 'othree/xml.vim'

"Plug 'nvim-tree/nvim-tree.lua'
"Plug 'nvim-tree/nvim-web-devicons'

" For NERDTree Plugs
Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cdelledonne/vim-cmake'
"Plug 'yegappan/taglist'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'simrat39/symbols-outline.nvim'
"Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'

"Plug 'glepnir/dashboard-nvim'


" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" for vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" For vim-cpp-enhanced-highlight
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" For NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" For coc
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" General use
set encoding=utf-8
set t_Co=256

"colorscheme lunaperche
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

map <F5> :bn<CR>
map <F6> :bp<CR>
map <F11> :set syntax=xml<CR>
" Close all buffers
map <F12> :bufdo bwipeout<CR>

set nu
syntax on

"set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set list

"set lines=50 columns=170

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

lua <<EOF
-- For gitsigns
require("gitsigns").setup {
signcolumn = true,
current_line_blame = true,
current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
  delay = 500,
}
}

-- for nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
--require("nvim-tree").setup()

EOF
