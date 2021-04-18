call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()



"----------------
" SETTINGS 
"----------------

set autoread                          "Reload files changed outside vim
set backspace=indent,eol,start        "Allow backspace in insert mode
set clipboard=unnamed                 "Clipboard (so that yank goes to OS clipboard)
set columns=80                        "80 characters max width
set cursorline                        "Highlight current line
set expandtab                         "Expand tabs to spaces
set linebreak                         "Don't break line on middle of word
set nofoldenable                      "Don't fold chapters
set noswapfile                        "Stop creating swp files
set number                            "Show line numbers
set scrolloff=3                       "Start scrolling three lines before the horizontal window border
set shortmess+=I                      "Disable startup message
set tabstop=2 shiftwidth=2 expandtab  "Soft tabs
set wrap                              "Text wrap



"----------------
" THEME AND COLORS 
"----------------

colorscheme nord                      "Theme
hi Visual ctermbg=Blue ctermfg=Black  "Visual selection




"----------------
" KEY MAPPINGS 
"----------------

let mapleader = ","                   "Set leader key to comma
nmap <Leader>- <C-w>s                 "Split pane horizontall
nmap <Leader>\| <C-w>v                "Split pane vertically
nmap <Leader>j <C-w>j                 "Switch to pane below
nmap <Leader>k <C-w>k                 "Switch to pane on top
nmap <Leader>h <C-w>h                 "Switch to pane to the left
nmap <Leader>l <C-w>l                 "Switch to pane to the right



"----------------
" MISCELLANEOUS 
"----------------

" Change cursor shape between insert and normal mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
" Reset cursor on startup
" because the cursor is coming in insert mode from tmux/bash
" https://vi.stackexchange.com/a/21673
augroup ResetCursorShape
au!
autocmd VimEnter * :normal :startinsert :stopinsert
augroup END
