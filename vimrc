" Do not try to sacrifice vim functionality for vi compatability
set nocompatible

" ------------------------------------------------- "
" -------------------- Vundle --------------------- "
" ------------------------------------------------- "

" -- Syntax for installing Plugins
"
"  Hosted on Github: Plugin 'gmarik/Vundle'
"
"  Not hosted on Github: Plugin 'git://git.wincent.com/command-t.git'
"
"  Hosted on vimscripts: Plugin 'L9'

" -- Commands
"  :PluginList        - lists configured plugins
"  :PluginInstall     - installs plugins; append '!' to update
"  :PluginSearch foo  - searches for foo; append '!' to refresh local cache
"  :PluginClean       - confirms removal of unused plugins; append '!' to
"                       auto-approve

" Turn off default filetype controls while Vundle manages plugins
filetype off

" Add Vundle to the runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Call Vundle initialization function
call vundle#begin()

" ------------------- Plugins --------------------- "

" The Vundle package itself
Plugin 'gmarik/Vundle.vim'

" Lots of color schemes to play with
Plugin 'flazz/vim-colorschemes'

" Highlight unwanted whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Auto code completion
Plugin 'Valloric/YouCompleteMe'

"""""""""" Android plugins

" Add syntax highlighting for logcat files
" Plugin 'vim-scripts/Logcat-syntax-highlighter'

" Gradle integration and other Anroid nicities
" Plugin 'hsanson/vim-android'

"""""""""" Javascript plugins

" Linter
" Plugin 'shutnik/jshint2.vim'

call vundle#end()

" ------------------------------------------------- "
" ---------------- initial-config ----------------- "
" ------------------------------------------------- "

" Tell vim to recognize filetypes and load indent and plugin files
filetype indent plugin on

" Turn on syntax highlighting
syntax on

" ------------------------------------------------- "
" ----------------- color-scheme ------------------ "
" ------------------------------------------------- "

" Enable 256 colors
set t_Co=256

" Set the default colorschemes for vim and gvim
colorscheme wombat256mod

" ------------------------------------------------- "
" --------------------- gvim ---------------------- "
" ------------------------------------------------- "

if has('gui_running')
  colorscheme wombat
  set lines=50 columns=96
endif

" ------------------------------------------------- "
" ----------------- formatting -------------------- "
" ------------------------------------------------- "

" Highlight whitespace at the end of a line
let c_space_errors = 1

" Set tab columns
set tabstop=2

" Make vim recognized grouped spaces as a tab
set softtabstop=2

" Number of spaces to auto indent
set shiftwidth=2

" Convert tabs to spaces
set expandtab

" Auto indent each new line to the level of the prev line
set autoindent

" Highlight any characters that go past 100 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" ------------------------------------------------- "
" ------------------- movement -------------------- "
" ------------------------------------------------- "

" Enable mouse support in the console
set mouse=a

" Set the scroll edge above the bottom of the screen
set scrolloff=5

" ------------------------------------------------- "
" ----------------- line-numbers ------------------ "
" ------------------------------------------------- "

" Toggle between relative and absolute line numbers with <Ctrl+N>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set nonumber relativenumber
  endif
endfunc

noremap <C-n> :call NumberToggle()<cr>

" Turn on absolute numbering whenever vim loses focus
autocmd FocusLost * :set norelativenumber number
autocmd FocusGained * :set nonumber relativenumber

" Turn on absolute numbering in insert mode
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set nonumber relativenumber

" Begin in relative number mode
set relativenumber

" Show the line and column numbmer of a cursor position
set ruler

" ------------------------------------------------- "
" -------------------- search --------------------- "
" ------------------------------------------------- "

" Match search terms as they are typed
set incsearch

" Highlight matched search terms
set hlsearch

" Toggle highlights with <Ctrl-l>
nnoremap <silent> <C-l> :set invhls<CR><C-l>

" Ignore case with all-lowercase searches, but be strict with uppercase
" For example: first_func matches First_Func and first_Func
" but first_Func only matches first_Func
set ignorecase smartcase

" Show match at the center of the screen rather than the bottom
nmap n nzz
nmap N Nzz

" ------------------------------------------------- "
" ------------------- buffers --------------------- "
" ------------------------------------------------- "

" Set the size of the undo buffer
set undolevels=1000

" ------------------------------------------------- "
" ------------------- command --------------------- "
" ------------------------------------------------- "

" Set the size of the command history
set history=1000

" Add tab completion similar to the terminal
" Press tab again to select an option
set wildmenu
set wildmode=list:longest,full

" Set status line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" ------------------------------------------------- "
" ------------------ c-language ------------------- "
" ------------------------------------------------- "

" Auto indent for typical C syntax
set cindent

" If parentheses are not closed, indent next line to the same level
set cino=(0

" ------------------------------------------------- "
" ----------------- miscellaneous ----------------- "
" ------------------------------------------------- "

" Make sure the encoding is what you expect
set encoding=utf-8

" Remap jj to <Esc> in insert mode
inoremap jj <Esc>

" Show matching parens
set showmatch

" Make backspace work like a wysiwyg
set backspace=indent,eol,start

" Set English spell checking, but disable by default
if version >=700
  set spl=en spell
  set nospell
endif

" Keep file clutter in its own directories.
" Note that you must make these directories manually.
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo
set directory=~/.vim/tmp
