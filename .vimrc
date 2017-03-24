" some simple python settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
" always use spaces instead of \t
set expandtab

filetype on
filetype plugin on

call pathogen#infect()
call pathogen#helptags()

" text wrapping for tex and md
autocmd bufreadpre *.tex setlocal textwidth=160
autocmd bufreadpre *.md setlocal textwidth=160

" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" LaTeX to unicode as you type in julia
let g:latex_to_unicode_auto = 1

set clipboard=unnamedplus


