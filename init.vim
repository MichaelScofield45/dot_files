"    _   __         _    ___                      _       _ __        _         
"   / | / /__  ____| |  / (_)___ ___             (_)___  (_) /__   __(_)___ ___ 
"  /  |/ / _ \/ __ \ | / / / __ `__ \  ______   / / __ \/ / __/ | / / / __ `__ \
" / /|  /  __/ /_/ / |/ / / / / / / / /_____/  / / / / / / /__| |/ / / / / / / /
"/_/ |_/\___/\____/|___/_/_/ /_/ /_/          /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/ 


"------------------------------General_Settings---------------------------------

syntax on

set noerrorbells
set nu
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set incsearch
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=81
set splitbelow
set splitright
set noshowmode


filetype off

"-----------------------------Plugins(Vim-Plug)---------------------------------

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

call plug#end()


"--------------------------------ColorScheme------------------------------------

"let g:gruvbox_material_transparent_background=1
"colorscheme gruvbox-material

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

let g:airline_them='onedark'
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:onedark_terminal_italics=1
colorscheme onedark

"--------------------------------Plugin-Setups----------------------------------
let $FZF_DEFAULT_COMMAND = 'rg --hidden -l "" '


filetype plugin indent on    
