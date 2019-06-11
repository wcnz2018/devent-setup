let g:clang_format#style_options__ = {
            \ "AccessModifierOffset" : -4,
            \ "AlignConsecutiveAssignments" : "true",
            \ "AlignEscapedNewlines" : "Left",
            \ "AlignTrailingComments" : "true",
            \ "AllowShortCaseLabelsOnASingleLine" : "false",
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortLoopsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BinPackArguments" : "false",
            \ "BinPackParameters" : "false",
            \ "BraceWrapping" : {
            \   "AfterClass" : "true",
            \   "AfterFunction" : "true",
            \   "SplitEmptyFunction" : "false",
            \  },
            \ "BreakBeforeBraces" : "Custom",
            \ "BreakBeforeTernaryOperators" : "true",
            \ "ColumnLimit" : 100,
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "FixNamespaceComments" : "true",
            \ "IndentWidth" : 4,
            \ "SortIncludes" : "true",
            \ "SpaceBeforeRangeBasedForLoopColon" : "true",
            \ "Standard" : "C++11",
            \  }

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

autocmd FileType c,cpp ClangFormatAutoEnable
