set nowrap
set showmode
set number
set cursorline
set cursorcolumn
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

Plug 'hoob3rt/lualine.nvim'
" icons in your statusline
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

let mapleader=" "

" use system clipboard
set clipboard+=unnamedplus
