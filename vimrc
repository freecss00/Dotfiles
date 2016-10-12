"-------------------------------------------------------------
" file
"-------------------------------------------------------------
filetype off
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,eucjp,cp932
set fileformat=unix
set fileformats=unix,dos,mac
" create no backup file
set nowritebackup
set nobackup
set noswapfile


"-------------------------------------------------------------
" general
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
set mouse=niv
set clipboard=unnamed
" keep undo history
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif


"-------------------------------------------------------------
" moving cursol
"-------------------------------------------------------------
set backspace=indent,eol,start
set scrolloff=8

" navigating in each mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
inoremap <C-a> <C-o>_
inoremap <C-e> <End>
vnoremap <C-a> <C-o>_
vnoremap <C-e> <End>

" able to move freely between virtual line
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

" display searching key's line in center of the screen
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
" displaying useful information
"-------------------------------------------------------------
set number
set ruler
set cursorline
set showcmd
set matchpairs+=<:>
set textwidth=0


"-------------------------------------------------------------
" key mapping
"-------------------------------------------------------------
" prefix key
let mapleader = "\<Space>"

nnoremap <Leader>. :edit $MYVIMRC<CR>
nnoremap <Leader>, :source $MYVIMRC<CR>
inoremap <silent> jj <Esc>
" revival yanked contents
" noremap <silent> PP "0p
nnoremap <silent> Y y$
vnoremap <silent> < <gv
vnoremap <silent> > >gv

nmap : ;
vmap : ;
nmap ; :
vmap ; :
nnoremap : q:a
vnoremap : q:a
nnoremap / q/a
vnoremap / q/a

" operating window and tab
" nnoremap s <Nop>
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
nnoremap ss :<C-u>split<CR>
nnoremap sv :<C-u>vsplit<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" disable middle mouse input
map <MiddleMouse>   <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse>   <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>


"-------------------------------------------------------------
" plugin
"-------------------------------------------------------------
:source ~/.vim/mycommand.vim


"-------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !executable('git')
    echo "Please install git."
    finish
endif

if !isdirectory(s:dein_repo_dir)
    echo "Please install dein.vim."
    function! s:install_dein()
        if input("Install dein.vim? [y/n] : ") == "y"
            execute "!git clone git://github.com/Shougo/dein.vim "
                    \ . s:dein_repo_dir
            echo "dein has installed. Please restart vim."
        else
            echo "Canceled."
        endif
    endfunction
    augroup install-dein
        autocmd!
        autocmd VimEnter * call s:install_dein()
    augroup END
    finish
endif

if &compatible
    set nocompatible
endif

execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
call dein#begin('~/.cache/dein')

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build':'make'})
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" unite source
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/unite-outline')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('thinca/vim-ref')
call dein#add('osyo-manga/unite-quickfix')
call dein#add('rhysd/quickrun-unite-quickfix-outputter')

" color scheme
call dein#add('altercation/vim-colors-solarized')
call dein#add('tomasr/molokai')
call dein#add('nanotech/jellybeans.vim')

" programing language
call dein#add('Shougo/neoinclude.vim')
call dein#add('justmao945/vim-clang')
call dein#add('davidhalter/jedi-vim')

" vim-operator
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-operator-replace')
call dein#add('rhysd/vim-operator-surround')

" vim-textobj
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-entire')
call dein#add('kana/vim-textobj-line')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-syntax')
call dein#add('kana/vim-textobj-function')
call dein#add('kana/vim-textobj-jabraces')
call dein#add('kana/vim-textobj-underscore')
call dein#add('kana/vim-textobj-lastpat')
call dein#add('kana/vim-textobj-fold')
call dein#add('bps/vim-textobj-python')
call dein#add('thinca/vim-textobj-between')
call dein#add('thinca/vim-textobj-comment')
call dein#add('osyo-manga/vim-textobj-multiblock')
call dein#add('sgur/vim-textobj-parameter')
call dein#add('saihoooooooo/vim-textobj-space')
call dein#add('mattn/vim-textobj-url')
call dein#add('gilligan/textobj-lastpaste')

" general
call dein#add('lilydjwg/colorizer')
call dein#add('tomtom/tcomment_vim')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('Yggdroot/indentLine')
call dein#add('kana/vim-smartinput')
call dein#add('thinca/vim-quickrun')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('jceb/vim-hier')
call dein#add('dannyob/quickfixstatus')
call dein#add('KazuakiM/vim-qfsigns')
call dein#add('KazuakiM/vim-qfstatusline')
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
filetype on


"-------------------------------------------------------------
" color scheme
"-------------------------------------------------------------
syntax enable
colorscheme solarized
let g:solarized_contrast = 'high'
if &term =~ "xterm-256color" || "screen-256color"
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif


"-------------------------------------------------------------
" vim-hier
"-------------------------------------------------------------
highlight HierWarning cterm=BOLD gui=undercurl guisp=red
let g:hier_highlight_group_qf = 'HierWarning'

"-------------------------------------------------------------
" indentLine
"-------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_faster = 1


"-------------------------------------------------------------
" vim-auto-save
"-------------------------------------------------------------
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
" Vim-auto-save conflict with other plugins if this variable is enabled.
let g:auto_save_in_insert_mode = 0


"-------------------------------------------------------------
" vim-smartinput
"-------------------------------------------------------------
" TODO: add setting
" http://rhysd.hatenablog.com/entry/20121017/1350444269
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
            \   'at'    : '(\%#)',
            \   'char'  : '<Space>',
            \   'input' : '<Space><Space><Left>',
            \   })

call smartinput#define_rule({
            \   'at'    : '( \%# )',
            \   'char'  : '<BS>',
            \   'input' : '<Del><BS>',
            \   })

call smartinput#define_rule({
            \   'at': '\s\+\%#',
            \   'char': '<CR>',
            \   'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
            \   })

" below setting is for cpp
call smartinput#define_rule({
            \   'at'       : '\%(\<struct\>\|\<class\>\|\<enum\>\)\s*\w\+.*\%#',
            \   'char'     : '{',
            \   'input'    : '{};<Left><Left>',
            \   'filetype' : ['cpp'],
            \   })

call smartinput#map_to_trigger('i', ';', ';', ';')
call smartinput#define_rule({
            \   'at'       : ';\%#',
            \   'char'     : ';',
            \   'input'    : '<BS>::',
            \   'filetype' : ['cpp'],
            \   })

" support input 'boost::'
call smartinput#define_rule({
            \   'at'       : '\<b;\%#',
            \   'char'     : ';',
            \   'input'    : '<BS>oost::',
            \   'filetype' : ['cpp'],
            \   })

" support input 'std::'
call smartinput#define_rule({
            \   'at'       : '\<s;\%#',
            \   'char'     : ';',
            \   'input'    : '<BS>td::',
            \   'filetype' : ['cpp'],
            \   })


"-------------------------------------------------------------
" vim-textobj
"-------------------------------------------------------------
" key mapping list
" e    :      entire field of buffer
" l    :      cursol line
" f    :      inner function
" _    :      text between under score
" S    :      multiple spaces
" b    :      some character as blacket, 
" a, i :      argument of being function
" etc..


"-------------------------------------------------------------
" vim-operator-surround
"-------------------------------------------------------------
nmap <silent>ys <Plug>(operaor-surround-append)
nmap <silent>ds <Plug>(operaor-surround-delete)
nmap <silent>cs <Plug>(operaor-surround-replace)

"-------------------------------------------------------------
" vim-easy-align
"-------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)


"-------------------------------------------------------------
" vim-quickrun
"-------------------------------------------------------------
nnoremap <silent> <Leader>r :write<CR>:<C-u>QuickRun -mode n<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
let g:quickrun_config = {
\   '_': {
\        'runner' : 'vimproc',
\        'runner/vimproc/updatetime' : '500',
\        'outputter' : 'error',
\        'outputter/error/success' : 'buffer',
\        'outputter/error/error' : 'quickfix',
\        'outputter/buffer/split' : 'rightbelow 8sp',
\        'outputter/buffer/close_on_empty' : 1,
\        'hook/close_buffer/enable_empty_data': 1,
\    },
\
\   'c': {
\        'cmdopt' : '-lm',
\    },
\
\   'cpp/g++': {
\        'cmdopt' : '-std=c++14 -Wall',
\    },
\}


"-------------------------------------------------------------
" watchdogs.vim
"-------------------------------------------------------------
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1

let g:quickrun_config = {
\  'watchdogs_checker/_' : {
\       'runner/vimproc/updatetime' : 40,
\       'outputter/quickfix/open_cmd' : '',
\       'hook/u_nya_/enable' : 1,
\       'hook/echo/enable' : 1,
\       'hook/echo/output_success' : '> Watchdogs: No Errors Found.',
\       'hook/echo/output_failure' : '> Watchdogs: Some Errors Found.',
\       'hook/qfstatuslne_update/enable_exit' : 1,
\       'hook/qfstatuslne_update/priority_exit' : 4,
\       'hook/qfsigns_update/enable_exit' : 1,
\       'hook/qfsigns_update/priority_exit' : 3,
\   },
\   
\   'watchdogs_checker/g++' : {
\       'cmdopt' : '-Wall'
\   },
\
\   'watchdogs_checker/clang++' : {
\       'cmdopt' : '-Wall'
\   },
\}

" too heavy
" augroup my_watchdogs
"     autocmd!
"     autocmd InsertLeave,BufWritePost,TextChanged *.c,*.h     WatchdogsRun
"     autocmd InsertLeave,BufWritePost,TextChanged *.cpp,*.hpp WatchdogsRun
"     autocmd InsertLeave,BufWritePost,TextChanged *.py        WatchdogsRun
"     autocmd InsertLeave,BufWritePost,TextChanged *.java      WatchdogsRun
"     autocmd InsertLeave,BufWritePost,TextChanged *.rb        WatchdogsRun
"     autocmd BufRead *.c,*.h      WatchdogsRun
"     autocmd BufRead *.cpp,*.hpp  WatchdogsRun
"     autocmd BufRead *.py         WatchdogsRun
"     autocmd BufRead *.java       WatchdogsRun
"     autocmd BufRead *.rb         WatchdogsRun
" augroup END

call watchdogs#setup(g:quickrun_config)


"-------------------------------------------------------------
" lightline.vim
"-------------------------------------------------------------
set laststatus=2
set noshowmode

" setting for watchdogs.vim
" let g:lightline = {
" \   'made_map': {'c': 'NORMAL'},
" \   'active' : {
" \       'right': [ [ 'qfstatusline', 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ],
" \   },
" \   'component_expand': {
" \       'qfstatusline': 'qstatusline#Update',
" \   },
" \   'component_type':{
" \      'qfstatusline': 'qfstatusline#Update',
" \   },
" \}
" let g:Qfstatusline#UpdateCmd = function('lightline#update')


"-------------------------------------------------------------
" unite.vim
"-------------------------------------------------------------
let g:unite_enable_insert = 1
let g:unite_ignore_source_files = [ "*.git" ]
let g:unite_source_file_mru_filename_format = ''

" decide tool for 'grep'
if executable('hw')
  " https://github.com/tkengo/highway
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
  " https://github.com/ggreer/the_silver_searcher
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = 
        \ '-i -vimgrep --hidden --ignore '.
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

" unite prefix key
nnoremap [unite] <Nop>
nmap <Space> [unite]

" unite key binding "{{{
nnoremap <silent> [unite]a :<C-u>Unite file_rec/async:!       -buffer-name=files  -no-split -start-insert<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer                 -buffer-name=buffer -no-split -start-insert<CR>
nnoremap <silent> [unite]f :<C-u>Unite file                   -buffer-name=files  -no-split -start-insert<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:.                 -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru directory_mru -buffer-name=mru -no-split -start-insert <CR>
nnoremap <silent> [unite]o :<C-u>Unite outline                -buffer-name=outline -vertical -winwidth=30<CR>
nnoremap <silent> [unite]p :<C-u>Unite menu                   -buffer-name=menu -no-split<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank           -buffer-name=yank -no-split<CR>
"}}}

call unite#custom#profile('action', 'context', {
\ 'start_insert' : 1
\})

call unite#custom_max_candidates('file_mru,directory_mru', '25')
call unite#custom#source('line_migemo', 'matchers', 'matcher_migemo')
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" custom filters "{{{
call unite#custom#source('buffer,file_rec,fire_rec/async,file_rec/git', 'converters', ['converter_uniq_word'])
call unite#custom#source('file_rec,fire_rec/async,file_rec/git,file_mru', 'converters', ['converter_uniq_word'])
call unite#custom#source('buffer', 'converters', ['converter_uniq_word', 'converter_worc_abbr'])
"}}}

autocmd FileType unite nmap <silent><buffer>: :
autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings() "{{{
    call unite#custom#default_action('directory', 'vimfiler')
    " call unite#custom#default_action('directory', 'narrow')
    nmap <buffer> <Esc> <Plug>(unite_exit)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    nmap <silent><buffer><expr> s unite#smartmap('s', unite#do_action('split'))
    nmap <silent><buffer><expr> v unite#smartmap('v', unite#do_action('vsplit'))
    nmap <silent><buffer><expr> f unite#smartmap('f', unite#do_action('vimfiler'))
endfunction "}}}

" unite-menu "{{{
if !exists("g:unite_source_menu_menus")
    let g:unite_source_menu_menus = {}
endif

" unite-shortcut
let g:unite_source_menu_menus.shortcut = {
\   "description" : "shortcut"
\}

" let g:unite_source_menu_menus.shortcut.candidates = [
" TODO: add some useful shortcuts
"\   ["shortcut name", command or directory or file etc..],
"\]

function! g:unite_source_menu_menus.shortcut.map(key, value)
    let [word, value] = a:value

    if isdirectory(value)
        return {
\               "word" : "[directory] ".word,
\               "kind" : "directory",
\               "action__directory" : value
\           }
    elseif !empty(glob(value))
        return {
\               "word" : "[file] ".word,
\               "kind" : "file",
\               "default_action" : "tabdrop",
\               "action__path" : value,
\           }
    else
        return {
\               "word" : "[command] ".word,
\               "kind" : "command",
\               "action__command" : value
\           }
    endif
endfunction
"}}}

"-------------------------------------------------------------
" vimfiler
"-------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" nnoremap <Leader>e :<C-u>VimFilerBufferDir -split -status -winwidth=35 -toggle -no-quit<CR>
nnoremap <Leader>e :<C-u>VimFilerExplorer -status -winwidth=35 -toggle<CR>
nnoremap <Leader>v :<C-u>VimFilerBufferDir -status<CR>

autocmd VimEnter * if !argc() | VimFiler | endif
autocmd BufEnter * if (bufnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
autocmd FileType vimfiler nnoremap <silent><buffer>i :<C-u>call UniteFileCurrentDir()<CR>
autocmd FileType vimfiler nnoremap <silent><buffer>/ :<C-u>call UniteFileCurrentDir()<CR>
autocmd FileType vimfiler nmap <silent><buffer>: :

function! UniteFileCurrentDir()
    let path = vimfiler#helper#_get_file_directory()
    execute ':Unite file directory -start-insert -path='.path
endfunction

if has('win32') || has('win64')
  let g:unite_kind_file_use_trashbox = 1
else
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = ' '
  let g:vimfiler_readonly_file_icon = '✗'
  let g:vimfiler_marked_file_icon = '✓'
endif


"-------------------------------------------------------------
" neocomplete.vim
"-------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1

let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#auto_complete_delay = 30

let g:neocomplete#max_list = 25
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
" example: 'lang' : 'path to completion dictionary'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 100

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" omni-completion "{{{
" autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

" key mappings "{{{
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort "{{{
  return pumvisible() ? neocomplete#smart_close_popup() : "\<CR>"
endfunction
"}}}

inoremap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] +~ '\s'
endfunction
"}}}
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" "}}}
" "}}}


"-------------------------------------------------------------
" programing language
"-------------------------------------------------------------
let g:neocomplete#force_overwrite_completefunc = 1

" cpp "{{{
autocmd FileType cpp call s:my_cpp_setting()
function! s:my_cpp_setting()
    setlocal path+=/usr/local/opt/boost/include
    setlocal matchpairs+=<:>
endfunction
" using 'vim-clang' plugin
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:clang_auto= 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
"}}}

" python
autocmd FileType python setlocal omnifunc=jedi#completions
	let g:jedi#completions_enabled = 0
	let g:jedi#auto_vim_configuration = 0
	let g:jedi#smart_auto_mappings = 0
	let g:neocomplete#force_omni_input_patterns.python =
	\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " alternative pattern: '\h\w*\|[^. \t]\.\w*'
