"    _   __         _    ___                      _       _ __        _         
"   / | / /__  ____| |  / (_)___ ___             (_)___  (_) /__   __(_)___ ___ 
"  /  |/ / _ \/ __ \ | / / / __ `__ \  ______   / / __ \/ / __/ | / / / __ `__ \
" / /|  /  __/ /_/ / |/ / / / / / / / /_____/  / / / / / / /__| |/ / / / / / / /
"/_/ |_/\___/\____/|___/_/_/ /_/ /_/          /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/ 


"------------------------------General_Settings---------------------------------

syntax on

set noerrorbells
set nu rnu
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2
set expandtab
set smartindent
set nowrap
set hidden
set smartcase
set noswapfile
set incsearch
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set colorcolumn=80
set splitbelow
set splitright
set noshowmode
"set mouse=a      " Allow for mouse interaction for window resizing and movement.

set termguicolors " Allow for al 24 million color choices in terminal.

set pyxversion=3

filetype off

source $HOME/.config/nvim/plug-config/coc.vim " Path to config file for coc.

"-----------------------------Plugins(Vim-Plug)---------------------------------

call plug#begin('~/.config/nvim/plugged')

Plug 'jremmen/vim-ripgrep'        " grep for vim
Plug 'leafgarland/typescript-vim' " typescript syntax for vim
Plug 'vim-utils/vim-man'          " man page for vim

"...............................................................................

Plug 'sainnhe/gruvbox-material'   " gruvbox, just better.
Plug 'morhetz/gruvbox'            " gruvbox normal colorscheme.
Plug 'senran101604/neotrix.vim'   " Cool retro colorscheme.
Plug 'joshdick/onedark.vim'       " onedark theme from the Atom Editor, just nice.
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }   " spaceduck colorscheme

"...............................................................................

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " installs fzf to system
Plug 'junegunn/fzf.vim'                             " installs fzf to vim
Plug 'itchyny/lightline.vim'                        " custom status line for vim
Plug 'sheerun/vim-polyglot'                         " advanced syntax highlighting for many languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Intellisense completion for Neovim

call plug#end()


"--------------------------------ColorScheme------------------------------------
" let g:gruvbox_material_transparent_background=1
colorscheme gruvbox-material

"let g:lightline = {
"  \ 'colorscheme': 'gruvbox_material',
"  \ }

" SPACEDUCK config for changing terminal color.
"............................................................................... 
"colorscheme spaceduck 
"if exists('+termguicolors')
"      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"      set termguicolors
"    endif
" let g:lightline = {
"     \ 'colorscheme': 'spaceduck',
"     \ }
"...............................................................................

"--------------------------------Plugin-Setups----------------------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

let g:netrw_banner=0 " Disable file-manager top banner.

filetype plugin indent on    
