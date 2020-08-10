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

Plug 'jremmen/vim-ripgrep' "grep for vim
Plug 'leafgarland/typescript-vim' "typescript syntax for vim
Plug 'vim-utils/vim-man' "man page for vim
Plug 'lyuts/vim-rtags' "rtag usage for vim
Plug 'mbbill/undotree' "undo steps
Plug 'ludovicchabant/vim-gutentags' "mixed with ctags for def. jumping
Plug 'sainnhe/gruvbox-material' "gruvbox, just better
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "installs fzf to system
Plug 'junegunn/fzf.vim' "installs fzf to vim
Plug 'joshdick/onedark.vim' "onedark theme from the Atom Editor, just nice
Plug 'itchyny/lightline.vim' "custom status line for vim
Plug 'sheerun/vim-polyglot' "advanced syntax highlighting for many languages


call plug#end()


"--------------------------------ColorScheme------------------------------------

"let g:gruvbox_material_transparent_background=1
"colorscheme gruvbox-material

"if (has("autocmd") && !has("gui_running"))
"  augroup colorset
"    autocmd!
"    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"  augroup END
"endif

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
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
