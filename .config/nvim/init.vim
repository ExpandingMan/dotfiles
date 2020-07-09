" ~~~~~~~~~~~~~~ this is the night, of the Expanding Man ~~~~
" ~~ I take one last drag, as I approach the stand ~~~~~~~~~~

let mapleader = " "      | " Map leader to space
let maplocalleader = " " | " Map localleader to space

" package manager vim-plug
call plug#begin('~/.config/nvim/plugged')
" colors
Plug 'dracula/vim'

" language support
Plug 'JuliaEditorSupport/julia-vim'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'ziglang/zig.vim'

" LSP
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/diagnostic-nvim'

" git interaction
Plug 'tpope/vim-fugitive'

" tagbar buffer navigation
Plug 'majutsushi/tagbar'

" motions
Plug 'easymotion/vim-easymotion'

" tables
Plug 'godlygeek/tabular'
Plug 'chrisbra/csv.vim'

" gives us lists of key bindings
Plug 'liuchengxu/vim-which-key'

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

" code completion via racer for rust
Plug 'racer-rust/vim-racer'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" repl
Plug 'Vigemus/iron.nvim'

" nerdtree
Plug 'scrooloose/nerdtree'

" linting and completion (also do UpdateRemotePlugins manually)
Plug 'dense-analysis/ale'

" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on

" spaces instead of tabs
set tabstop=4
set shiftwidth=4
" always use spaces instead of \t
set expandtab
set autoindent
set smarttab

" deoplete
let g:deoplete#enable_at_startup = 1
" deoplete tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" ensure deoplete automatically closes preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" text wrapping for tex and md
autocmd bufreadpre *.tex setlocal textwidth=90
autocmd bufreadpre *.md setlocal textwidth=90

" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" LaTeX to unicode as you type in julia
let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_tab = 1

" ----------------------- vim-which-key -----------------------------------
set timeoutlen=500

let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

" which key can't figure out the easy-motion mappings
let g:which_key_map = {" ": 'easy motion (re-input to use)'}
" -------------------------------------------------------------------------

" toggle LaTeX to unicode key
nnoremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <expr> <F7> LaTeXtoUnicode#Toggle()
" julia function form toggle
noremap <Leader>f :call julia#toggle_function_blockassign()<CR>
let g:which_key_map.f = 'julia function block toggle'

" fix copy-paste buffers
set clipboard+=unnamedplus

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
" turn off annoying powerline fonts
let g:airline_powerline_fonts = 0

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

" terminal mode bindings
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"---------------------- REPL interaction (iron.nvim) ------------------------------
let g:which_key_map.r = {'name': 'REPL interaction (iron)'}

nmap <localleader>rt    <Plug>(iron-send-motion)
let g:which_key_map.r.t = 'motion send'
vmap <localleader>rv    <Plug>(iron-visual-send)
let g:which_key_map.r.v = 'visual send'
nmap <localleader>rr    <Plug>(iron-repeat-cmd)
let g:which_key_map.r.r = 'repeat command'
nmap <localleader>rl    <Plug>(iron-send-line)
let g:which_key_map.r.l = 'send line'
nmap <localleader>r<CR> <Plug>(iron-cr)
let g:which_key_map.r.CR = 'carriage return'
nmap <localleader>ri    <plug>(iron-interrupt)
let g:which_key_map.r.i = 'interrupt'
nmap <localleader>rq    <Plug>(iron-exit)
let g:which_key_map.r.q = 'exit'
nmap <localleader>rc    <Plug>(iron-clear)
let g:which_key_map.r.c = 'clear'

nnoremap <Leader>rr :IronRepl<CR>
let g:which_key_map.r.r = 'start REPL'
"-----------------------------------------------------------------------------------


set nofoldenable    " get rid of that infernal folding
let g:vim_markdown_folding_disabled = 1

" disable freaky cursor styling
set guicursor=

" latex related
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
autocmd BufRead,BufNewFile *.tex set conceallevel=1
let g:tex_conceal='abdmg'

" disable ale highlighting
let g:ale_set_highlights = 0

" activate tagbar
nmap <F2> :TagbarToggle<CR>

" tagbar for Julia
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : [
        \ 't:struct', 'f:function', 'm:macro', 'c:const']
    \ }

" ctags config location
let g:tagbar_ctags_options = ['NONE', $HOME.'/.config/ctags']

" ----------------------- Julia Language Server ---------------------------
"  NOTE: you may need to manually do LspInstall julials
" -------------------------------------------------------------------------
lua << EOF
    local nvim_lsp = require'nvim_lsp'
    nvim_lsp.julials.setup({on_attach=require'diagnostic'.on_attach})
EOF

autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc

" show diagnostics when hovering for too long
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_show_sign = 0

let g:which_key_map.l = {'name': 'Language Server Protocol'}

nnoremap <silent> <leader>lg :lua vim.lsp.util.show_line_diagnostics()<CR>
let g:which_key_map.l.g = 'line diagonstics'
nnoremap <silent> <leader>lh :lua vim.lsp.buf.hover()<CR>
let g:which_key_map.l.h = 'documentation'
nnoremap <silent> <leader>lf :lua vim.lsp.buf.definition()<CR>
let g:which_key_map.l.f = 'jump to definition'
nnoremap <silent> <leader>lr :lua vim.lsp.buf.references()<CR>
let g:which_key_map.l.r = 'references'
nnoremap <silent> <leader>l0 :lua vim.lsp.buf.document_symbol()<CR>
let g:which_key_map.l.0 = 'document symbol'

let g:which_key_map.d = {'name': 'Directory'}

nnoremap <silent> <leader>dp :pwd<CR>
let g:which_key_map.d.p = 'show present working directory'
nnoremap <silent> <leader>dd :cd %:p:h<CR>:pwd<CR>
let g:which_key_map.d.d = 'change to directory of current file'
nnoremap <silent> <leader>de :cd %:p:h/..<CR>:pwd<CR>
let g:which_key_map.d.e = 'change to parent directory of current file directory'
nnoremap <silent> <leader>dh :cd<CR>:pwd<CR>
let g:which_key_map.d.h = 'change to home directory'
nnoremap <silent> <leader>dJ :cd -<CR>:pwd<CR>
let g:which_key_map.d.J = 'change to previous directory'
nnoremap <leader>da :set autochdir!<CR>
let g:which_key_map.d.a = 'toggle auto directory switching'

" disable obnoxious underlining of everything in the damn universe
let g:diagnostic_enable_underline = 0
" -------------------------------------------------------------------------
"  (end Julia Language Server)
" -------------------------------------------------------------------------
