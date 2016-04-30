"-------------------------------------------------------------
" file
"-------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,eucjp,cp932
set fileformat=unix
set fileformats=unix,dos,mac
" do not let to create file for preliminary
set nowritebackup
set nobackup
set noswapfile


"-------------------------------------------------------------
" system
"-------------------------------------------------------------
set wildmenu
set showmatch
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
set clipboard=unnamed,autoselect
set timeout timeoutlen=1000 ttimeoutlen=50


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
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

" be can move the cursol to virtual screen line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


"-------------------------------------------------------------
" saerch and replace 
"-------------------------------------------------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
set magic
nnoremap / /\v 
nnoremap <Esc><Esc> :nohlsearch<CR>

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
inoremap jj <Esc>
nnoremap Y y$

nnoremap : q:i
nnoremap / q/i

" window and tab-related key mappings
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>


"-------------------------------------------------------------
" plugin
"-------------------------------------------------------------

"-------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------
if &compatible
    set nocompatible
endif
set runtimepath^=~/.vim/dein/dein.vim

call dein#begin('~/.cache/dein')

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
    \ 'build':{
    \    'windows': 'tool\\update-dll-mingw',
    \    'cygwin': 'make -f make_cygwin.mak',
    \    'mac': 'make -f make_mac.mak',
    \    'linux': 'make',
    \    'unix': 'gmake',
    \    },
    \ })

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/unite.vim')

call dein#add('tomtom/tcomment_vim')
call dein#add('lilydjwg/colorizer')
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('Townk/vim-autoclose')
call dein#add('tpope/vim-surround')
call dein#add('thinca/vim-quickrun')
call dein#add('junegunn/vim-easy-align',{
    \ 'autoload': {
    \ 'commands': ['EasyAlign'],
    \ 'mappings': ['<Plug>(EasyAlign)'],
    \ }})
    

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on


"-------------------------------------------------------------
" color scheme
"-------------------------------------------------------------
syntax enable
set t_Co=256
colorscheme molokai
" set background=dark
" colorscheme solarized
if g:colors_name == 'solarized'
    let g:solarized_termcolors=16
    let g:solarized_termtrans=0
    let g:soralized_degrade=0
    let g:solarized_bold=1
    let g:solarized_underline=1
    let g:solarized_italic=1
    let g:solarized_contrast='normal'
    let g:solarized_visibiliity='normal'
endif


"-------------------------------------------------------------
" vim-easy-align
"-------------------------------------------------------------
vnoremap <Enter> <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign))


"-------------------------------------------------------------
" lightline.vim
"-------------------------------------------------------------
set laststatus=2
set noshowmode


"-------------------------------------------------------------
" vim-quickrun
"-------------------------------------------------------------
let g:quickrun_config={}
let g:quickrun_config.c = { 'cmdopt' : '-lm' }
let g:quickrun_config.cpp = { 'cmdopt' : '-std=c++14' }


"-------------------------------------------------------------
" neocomplete.vim
"-------------------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword cha
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" <CR>: complete by the selected candidate
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"
