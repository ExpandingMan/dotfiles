" this is the initialization script for neovim
" not that this goes in ~/.config/nvim
" along with everything that'd normally go in ~/.vim

" vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

" TODO consider switching to https://github.com/Shougo/dein.vim
" package manager
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" colors
Plugin 'dracula/vim'

" language support
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'lervag/vimtex'
Plugin 'cespare/vim-toml'
Plugin 'plasticboy/vim-markdown'
" tables
Plugin 'godlygeek/tabular'
Plugin 'chrisbra/csv.vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'

" nerdtree
Plugin 'scrooloose/nerdtree'

" linting and completion (also do UpdateRemotePlugins manually)
Plugin 'w0rp/ale'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'zchee/deoplete-jedi'

" search
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

" spaces instead of tabs
set tabstop=4
set shiftwidth=4
" always use spaces instead of \t
set expandtab
set autoindent
set smarttab

" text wrapping for tex and md
autocmd bufreadpre *.tex setlocal textwidth=90
autocmd bufreadpre *.md setlocal textwidth=90

" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" LaTeX to unicode as you type in julia
let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_tab = 1
" set specific julia version
let g:default_julia_version = "0.7"

" toggle LaTeX to unicode key
nnoremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <expr> <F7> LaTeXtoUnicode#Toggle()
" julia function form toggle
noremap <Leader>f :call julia#toggle_function_blockassign()<CR>

" fix copy-paste buffers
set clipboard=unnamedplus

" enable true color
" note that one should enable true color in tmux if using tmux
set termguicolors

syntax enable
" disable dracula italics because they look weird
let g:dracula_italic = 0
colorscheme dracula

" restores transparent background (or whatever is set by gnome-terminal)
" overrides settings from color-scheme
hi Normal guibg=NONE ctermbg=NONE
" ensure transparency stays past end of file
hi NonText guibg=NONE ctermbg=NONE

" airline theme
" let g:airline_theme='oceanicnext'
let g:airline_theme='dracula'
" airline powerline fonts, must be installed
let g:airline_powerline_fonts = 1

" ==== modifications to DRACULA color scheme ====
" (these only use colors already in the palette)
" make macros orange
autocmd BufRead,BufNewFile *.jl hi Identifier ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb86c guibg=NONE gui=NONE
" make constants red
autocmd BufRead,BufNewFile *.jl hi Constant ctermfg=Red ctermbg=NONE cterm=NONE guifg=#ff5555 guibg=NONE gui=NONE
" make macros green
" autocmd BufRead,BufNewFile *.jl hi PreProc ctermfg=84 ctermbg=NONE cterm=NONE guifg=#50fa7b guibg=NONE gui=italic
autocmd BufRead,BufNewFile *.jl hi Macro ctermfg=84 ctermbg=NONE cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE

" some keyboard shortcuts, recall that leader is \ by default
" nerdtree keyboard shortcut
nmap <silent> <Leader>t :NERDTreeToggle<CR>

" turn on deoplete
let g:deoplete#enable_at_startup = 1
" deoplete tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" ensure deoplete automatically closes preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" disable freaky cursor styling
set guicursor=

" language server
" Note that one must install LanguageServer.jl in Julia
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
\       server.runlinter = false;
\       run(server);
\   '],
\ }


" latex related
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
autocmd BufRead,BufNewFile *.tex set conceallevel=1
let g:tex_conceal='abdmg'
