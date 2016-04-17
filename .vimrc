"-------------------------------------------------------------
" file
"-------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,eucjp,cp932
set fileformat=unix
set fileformats=unix,dos,mac
" not let to create file for preliminary
set nowritebackup
set nobackup
set noswapfile


"-------------------------------------------------------------
" system
"-------------------------------------------------------------
set wildmenu
set confirm
set autoread
set infercase
set splitbelow
set splitright
set history=1000
set novisualbell
set visualbell t_vb=
set virtualedit=block
set secure

" color scheme
colorscheme molokai


"-------------------------------------------------------------
" moving cursol
"-------------------------------------------------------------
set backspace=indent,eol,start
set scrolloff=8

" navigating in command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Left>
cnoremap <C-b> <Right>

" be can move the cursol to virtual display line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


"-------------------------------------------------------------
" saerch and replace 
"-------------------------------------------------------------
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan

" display search key at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

"-------------------------------------------------------------
" indent
"-------------------------------------------------------------
set expandtab
set autoindent
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"-------------------------------------------------------------
" be useful your screen
"-------------------------------------------------------------
set number
set ruler
set cursorline
set showcmd
set matchpairs+=<:>
set textwidth=0

"-------------------------------------------------------------
" key bind
"-------------------------------------------------------------
noremap  <C-s> <Esc>
noremap! <C-s> <Esc>
nnoremap Y y%

inoremap ( ()<Left>
inoremap { {}<Left>
