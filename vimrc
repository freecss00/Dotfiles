"-------------------------------------------------------------
" file
"-------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,eucjp,cp932
set fileformat=unix
set fileformats=unix,dos,mac
" do not let to create preliminary file
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
set clipboard=unnamed


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

" to be able to move about display virtual line
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
nmap Y y$

nmap : ;
nmap ; :
nmap : q:i
nmap / q/i

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
nnoremap sN :bn<CR>
nnoremap sP :bp<CR>
nnoremap st :tabnew<CR>
nnoremap sT :Unite tab<CR>
nnoremap ss q:isp 
nnoremap sv q:ivs 
nnoremap sq :q<CR>
nnoremap sQ :bd<CR>
nnoremap sb :Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :Unite buffer -buffer-name=file<CR>


"-------------------------------------------------------------
" ctags
"-------------------------------------------------------------
:set tag=./tags


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
call dein#add('Shougo/vimproc.vim', {'build':'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/unite.vim')

call dein#add('tomtom/tcomment_vim')
call dein#add('lilydjwg/colorizer')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('Yggdroot/indentLine')
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
" colorscheme molokai
" hi Normal     ctermbg=none
" hi Visual     ctermbg=237
" hi CursorLine ctermbg=237


"-------------------------------------------------------------
" lightline.vim
"-------------------------------------------------------------
set laststatus=2
set noshowmode


"-------------------------------------------------------------
" indentLine
"-------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_faster=1


"-------------------------------------------------------------
" vim-auto-save
"-------------------------------------------------------------
let g:auto_save=1
let g:auto_save_no_updatetime=1
" Vim-auto-save disturb other plugins if this variable is enabled. you should disable it.
let g:auto_save_in_insert_mode=0


"-------------------------------------------------------------
" vim-surround
"-------------------------------------------------------------
function! s:define_surround_mapping(key, mapping)
    let var_name = 'surround_'.char2nr(a:key)
    execute 'let b:' . var_name . ' = "' . a:mapping.'"'
endfunction

let bracket_dict = {
    \ '(': "(\r)",
    \ '[': "[\r]",
    \ '{': "{\r}",
    \ '<': "<\r>",
    \ '#': "#{\r}",
    \ }

for [key, mapping] in items(bracket_dict)
    call s:define_surround_mapping(key, mapping)
endfor


"-------------------------------------------------------------
" vim-quickrun
"-------------------------------------------------------------
let g:quickrun_config={}
let g:quickrun_config.c = { 'cmdopt' : '-lm' }
let g:quickrun_config.cpp = { 'cmdopt' : '-std=c++14' }


"-------------------------------------------------------------
" vim-easy-align
"-------------------------------------------------------------
vnoremap <Enter> <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign))


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
