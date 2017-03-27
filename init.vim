" this is the initialization script for neovim
" not that this goes in ~/.config/nvim
" along with everything that'd normally go in ~/.vim

" vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'neomake/neomake'
Plugin 'ExpandingMan/oceanic-next'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
" always use spaces instead of \t
set expandtab

" text wrapping for tex and md
autocmd bufreadpre *.tex setlocal textwidth=160
autocmd bufreadpre *.md setlocal textwidth=160

" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" LaTeX to unicode as you type in julia
let g:latex_to_unicode_auto = 1


" enable true color
" note that one should enable true color in tmux if using tmux
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

syntax enable
colorscheme OceanicNext

" airline theme
let g:airline_theme='oceanicnext'


