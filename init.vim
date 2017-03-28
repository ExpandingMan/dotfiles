" this is the initialization script for neovim
" not that this goes in ~/.config/nvim
" along with everything that'd normally go in ~/.vim

" vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

" this line is very important for making vundle work correctly
" if you don't include it, it will use ~/.vim
" TODO consider switching to https://github.com/Shougo/dein.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'neomake/neomake'
" note that vundle **always** looks at master, no matter what you do
Plugin 'ExpandingMan/oceanic-next'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'godlygeek/tabular'
" remember that you have to run `./install.py` for ycm (running here doesn't
" work).  also see https://github.com/neovim/neovim/tree/master/contrib/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" fuzzy text searches. installs fzf
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'
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
set termguicolors

syntax enable
colorscheme OceanicNext

" airline theme
let g:airline_theme='oceanicnext'

" some keyboard shortcuts, recall that leader is \ by default
" nerdtree keyboard shortcut
nmap <silent> <Leader>t :NERDTreeToggle<CR>
" neomake keyboard shortcut
nmap <silent> <Leader>l :Neomake<CR>


