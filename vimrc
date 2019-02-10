" file "{{{
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
"}}}

" general "{{{
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
set foldmethod=marker
set backspace=indent,eol,start
set scrolloff=8
" keep undo history
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif
" disable the "Press Enter or type command to continue" prompt
set shortmess=a
set cmdheight=2
set synmaxcol=200
let g:vim_indent_cont = 0
set nocursorline
"}}}

" saerch and replace "{{{
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
"}}}

" indent "{{{
"-------------------------------------------------------------
set expandtab
set autoindent
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"}}}

" screen "{{{
"-------------------------------------------------------------
set number
set ruler
set cursorline
set showcmd
set textwidth=0
"}}}

" key mapping "{{{
"-------------------------------------------------------------
" prefix key
let mapleader = "\<Space>"

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
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap <Leader>. :edit $MYVIMRC<CR>
nnoremap <Leader>, :source $MYVIMRC<CR>
inoremap <silent> jj <Esc>
nnoremap <silent> Y y$
vnoremap <silent> w e
vnoremap <silent> < <gv
vnoremap <silent> > >gv
" revival yanked contents
" noremap <silent> PP "0p

map ; :
" nnoremap : ;
" vnoremap : ;
" nnoremap ; :
" vnoremap ; :
nnoremap : q:a
vnoremap : q:a
nnoremap / q/a
vnoremap / q/a

" operating window and tab
nnoremap s <Nop>
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>wl <C-w>l
nnoremap <Space>wh <C-w>h
nnoremap <Space>wJ <C-w>J
nnoremap <Space>wK <C-w>K
nnoremap <Space>wL <C-w>L
nnoremap <Space>wH <C-w>H
snoremap sn gt
nnoremap sp gTk
nnoremap sr <C-w>r
" nnoremap sN :<C-u>bn<CR>
" nnoremap sP :<C-u>bp<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap ss :<C-u>split<CR>
nnoremap sv :<C-u>vsplit<CR>
nnoremap Q :<C-u>call SmartQuit()<CR>
function! SmartQuit()
    if bufname('%') == '[Command Line]'
        execute ':q'
        return
    endif
    let num_buf = len(getbufinfo({'buflisted':1}))
    if num_buf == 1
        execute ':q'
    else
        execute ':bdelete'
    endif
endfunction
"}}}

" plugin "{{{
"-------------------------------------------------------------
:source ~/.vim/mycommand.vim
"}}}

" vim-textobj "{{{
"-------------------------------------------------------------
" key mapping list
" b     :   some characters considered as bracket
" c     :   comment region
" e     :   entire region of buffer
" f     :   inner function
" i,I   :   indentation level
" l     :   a cursol line
" s[x]  :   surrounded by a following specific character
" u     :   a url
" ,     :   an argument of function
" ,w    :   a word in a long identifier(e.g. snake_case, camelCase)

" vim-textobj-multiblock {{{
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
let g:textobj_multiblock_blocks = [
	\	[ "(", ")" ],
	\	[ "[", "]" ],
	\	[ "{", "}" ],
	\	[ '<', '>' ],
	\	[ '"', '"', 1 ],
	\	[ "'", "'", 1 ],
    \]
"}}} 

" vim-textobj-comment {{{
let g:textobj_comment_no_default_key_mappings = 1
omap ac <Plug>(textobj-comment-a)
omap ic <Plug>(textobj-comment-i)
vmap ac <Plug>(textobj-comment-a)
vmap ic <Plug>(textobj-comment-i)
"}}}

" vim-textobj-from_regexp {{{
" omap <expr> in textobj#from_regexp#mapexpr('\d\+')
" omap <expr> i<C-w> textobj#from_regexp#mapexpr('\w\+')
" vmap <expr> i<C-w> textobj#from_regexp#mapexpr('\w\+')
" omap <expr> i<A-w> textobj#from_regexp#mapexpr('[A-Za-z0-9]\+')
" vmap <expr> i<A-w> textobj#from_regexp#mapexpr('[A-Za-z0-9]\+')
"}}}

" vim-textobj-between {{{
omap as <Plug>(textobj-between-a) 
omap is <Plug>(textobj-between-i) 
vmap as <Plug>(textobj-between-a) 
vmap is <Plug>(textobj-between-i) 
"}}}
"}}}

" vim-expand-region "{{{
"-------------------------------------------------------------
vmap K <Plug>(expand_region_expand)
vmap J <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'ii'  :0,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }
"}}}

" dein.vim "{{{
"-----------------------------------------------------------
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

" utility
call dein#add('ryanoasis/vim-devicons')
call dein#add('lilydjwg/colorizer')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('Yggdroot/indentLine')
call dein#add('kana/vim-smartinput')
call dein#add('kana/vim-submode')
call dein#add('tpope/vim-fugitive')
call dein#add('easymotion/vim-easymotion')
call dein#add('ap/vim-buftabline')
    
" color scheme
call dein#add('altercation/vim-colors-solarized')
call dein#add('tomasr/molokai')
call dein#add('nanotech/jellybeans.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('vim-scripts/Wombat')
call dein#add('cocopon/iceberg.vim')

" vim-operator
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-operator-replace')
call dein#add('rhysd/vim-operator-surround')

" vim-textobj
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-entire')
call dein#add('kana/vim-textobj-line')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-function')
" call dein#add('kana/vim-textobj-syntax')
call dein#add('thinca/vim-textobj-between')
call dein#add('thinca/vim-textobj-comment')
call dein#add('osyo-manga/vim-textobj-multiblock')
call dein#add('sgur/vim-textobj-parameter')
call dein#add('mattn/vim-textobj-url')
call dein#add('h1mesuke/textobj-wiw')
call dein#add('terryma/vim-expand-region')

" coding
call dein#add('tomtom/tcomment_vim')
call dein#add('thinca/vim-quickrun')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('majutsushi/tagbar')
call dein#add('jceb/vim-hier')
call dein#add('dannyob/quickfixstatus')
call dein#add('KazuakiM/vim-qfsigns')
call dein#add('KazuakiM/vim-qfstatusline')
call dein#add('junegunn/vim-easy-align')

" programing language
call dein#add('Shougo/neoinclude.vim')
call dein#add('justmao945/vim-clang', {'on_ft': ['c', 'cpp']})
" call dein#add('Rip-Rip/clang_complete', {'on_ft': ['c', 'cpp']})
call dein#add('davidhalter/jedi-vim',   {'on_ft': ['python', 'python3']})
call dein#add('lambdalisue/vim-pyenv',  {
    \ 'depends': ['jedi-vim'],
    \ 'on_ft': ['python', 'python3']})

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on
"}}}

" vim-submode "{{{
"-------------------------------------------------------------
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '2<C-w>>')
call submode#map('bufmove', 'n', '', '<', '2<C-w><')
call submode#map('bufmove', 'n', '', '+', '2<C-w>+')
call submode#map('bufmove', 'n', '', '-', '2<C-w>-')
"}}}

" color scheme "{{{
"-------------------------------------------------------------
syntax enable
colorscheme jellybeans
if &term =~ "xterm-256color" || "screen-256color"
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif
" }}}

" vim-hier "{{{
"-------------------------------------------------------------
highlight HierWarning cterm=BOLD gui=undercurl guisp=red
let g:hier_highlight_group_qf = 'HierWarning'
"}}}

" indentLine "{{{
"-------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_faster = 1
"}}}

" vim-auto-save "{{{
"-------------------------------------------------------------
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
" Vim-auto-save conflict with other plugins if this variable is enabled.
let g:auto_save_in_insert_mode = 0
"}}}

" vim-smartinput "{{{
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

" setting below is for cpp
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
"}}}

" vim-operator-surround "{{{
"-------------------------------------------------------------
map <silent>ys <Plug>(operator-surround-append)
map <silent>ds <Plug>(operator-surround-delete)
map <silent>cs <Plug>(operator-surround-replace)
"}}}

" vim-easy-align "{{{
"-------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)
"}}}

" tagbar "{{{
"-------------------------------------------------------------
nnoremap <silent><Leader>t :TagbarToggle<CR>
"}}}

" vim-quickrun "{{{
"-------------------------------------------------------------
nnoremap  <Leader>r :write<CR>:QuickRun -mode n<CR>
vnoremap <silent> <Leader>r :QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
let g:quickrun_config = {}
let g:config = {
\   '_': {
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : '40',
\       'outputter' : 'error',
\       'outputter/error/success' : 'buffer',
\       'outputter/error/error' : 'quickfix',
\       'outputter/buffer/split' : 'rightbelow 8sp',
\       'outputter/buffer/close_on_empty' : 1,
\       'hook/close_buffer/enable_empty_data': 1,
\    },
\
\   'c': {
\       'cmdopt' : '-lm',
\    },
\
\   'cpp' : {
\       'type' : 'cpp/clang++'
\   },
\
\   'cpp/g++': {
\       'command' : 'g++',
\       'cmdopt' : '-std=c++14',
\    },
\
\   'cpp/clang++': {
\       'command' : 'clang++',
\       'cmdopt' : '-std=c++11',
\    },
\}
call extend(g:quickrun_config, g:config)
unlet g:config
"}}}

" watchdogs.vim "{{{
"-------------------------------------------------------------
" let g:watchdogs_check_CursorHold_enable = 1
"
" let g:config = {
" \  'watchdogs_checker/_' : {
" \       'runner/vimproc/updatetime' : 40,
" \       'outputter/quickfix/open_cmd' : '',
" \       'hook/u_nya_/enable' : 1,
" \       'hook/echo/enable' : 1,
" \       'hook/echo/output_success' : '> Watchdogs: No Errors Found.',
" \       'hook/echo/output_failure' : '> Watchdogs: Some Errors Found.',
" \       'hook/back_window/enable' : 1,
" \       'hook/back_window/enable_exit' : 1,
" \       'hook/qfstatuslne_update/enable_exit' : 1,
" \       'hook/qfstatuslne_update/priority_exit' : 4,
" \       'hook/qfsigns_update/enable_exit' : 1,
" \       'hook/qfsigns_update/priority_exit' : 3,
" \   },
" \
" \   'cpp/watchdogs_checker' : {
" \       'type' : 'watchdogs_checker/g++'
" \   },
" \   
" \   'watchdogs_checker/g++' : {
" \       'cmdopt' : '-std=c++14'
" \   },
" \
" \   'watchdogs_checker/clang++' : {
" \       'cmdopt' : '-Wall'
" \   },
" \}
" call extend(g:quickrun_config, g:config)
" unlet g:config
"
" call watchdogs#setup(g:quickrun_config)
" "}}}

" vim-devicons "{{{
"-------------------------------------------------------------
" change non-ascii font setting to "Droid Sans Mono Nerd Font" if you use iterm..
" see below for more details
" https://github.com/ryanoasis/vim-devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h12

function! DevIconFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! DevIconFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
"}}}

" lightline.vim "{{{
"-------------------------------------------------------------
set laststatus=2
set noshowmode

let g:lightline = {
\   'colorscheme': 'wombat',
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\      'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
\   },
\   'tab': {
\       
\   },
\   'component_function': {
\       'modified': 'LightlineModified',
\       'readonly': 'LightlineReadonly',
\       'fugitive': 'LightlineFugitive',
\       'filename': 'LightlineFilename',
\       'filetype': 'DevIconFiletype',
\       'fileformat': 'DevIconFileformat',
\       'fileencoding': 'LightlineFileencoding',
\       'mode': 'LightlineMode'
\   }
\ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" function! LightlineMode()
"   return winwidth(0) > 60 ? lightline#mode() : ''
" endfunction
" \}
function! LightlineMode()
  return  &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" \   'component_function': {
" \     'filetype': 'MyFiletype',
" \     'fileformat': 'MyFileformat',
" \   }
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
" let g:Qfstatusline#UpdateCmd = function('lightline#update')
" }}}

" unite.vim "{{{
"-------------------------------------------------------------
" unite prefix key
nnoremap [unite] <Nop>
nmap <Space> [unite]

" unite key mapping "{{{
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir file_rec/async:! -buffer-name=file_rec -start-insert<CR>
nnoremap <silent> [unite]f :<C-u>Unite file file/new                 -buffer-name=files -start-insert<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru directory_mru        -buffer-name=files -start-insert<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer                        -buffer-name=buffer -start-insert<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:.                        -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]p :<C-u>Unite command                       -buffer-name=command<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank                  -buffer-name=yank<CR>
" nnoremap <silent> [unite]o :<C-u>Unite outline                       -buffer-name=outline -vertical -winwidth=30<CR>
"}}}

let g:unite_enable_insert = 1
let g:unite_ignore_source_files = [ "*.git" ]
let g:unite_source_file_mru_filename_format = ''
let g:unite_matcher_fuzzy_max_input_length = 30

" decide tool for 'grep'
if executable('hw')
  " https://github.com/tkengo/highway
  let g:unite_source_rec_async_command = ['hw', '--follow-link', '--no-group', '--no-color', '-l']
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

call unite#custom#profile('default', 'context', {
\   'start_insert' : 1,
\   'prompt_direction' : 'top',
\   'prompt' : '> ',
\   'candidate_icon' : ' -',
\})

call unite#custom_max_candidates('file_mru,directory_mru', '100')
call unite#custom#default_action('directory', 'cd')
call unite#filters#matcher_default#use(['matcher_fuzzy'])

let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
call unite#custom#source('buffer,file_rec,fire_rec/async,file_rec/git', 'converters', ['converter_uniq_word'])
call unite#custom#source('file_rec,fire_rec/async,file_rec/git,file_mru', 'converters', ['converter_uniq_word'])
call unite#custom#source('buffer', 'converters', ['converter_uniq_word', 'converter_word_abbr'])
call unite#custom#source('file_mru', 'converters', 'converter_file_directory')

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
    autocmd FileType unite nnoremap <silent><buffer>: q:a
    imap <buffer> jj <Plug>(unite_insert_leave)
    " imap <buffer><expr> j unite#smart_map('j','')
    nmap <buffer> <Esc> <Plug>(unite_exit)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    imap <buffer> <Tab> <Plug>(unite_select_next_line)
    nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
    inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction "}}}

" unite custom "{{{
" action example "{{{
" let s:vimfiler_action = {
" \   'is_selectable' : 0,
" \}
" function! s:action_name.func(candidate)
"     " execute some command.
" endfunction
" call unite#custom#action('kind', 'vimfiler_custom', s:vimfiler_action)
" unlet s:action_name
"}}}

" unite menu
if !exists("g:unite_source_menu_menus")
    let g:unite_source_menu_menus = {}
endif

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
"}}}

" vimfiler "{{{
"-------------------------------------------------------------
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_ignore_pattern = '^\%(.git|.DS_Store\)'
" nnoremap <Leader>e :<C-u>VimFilerBufferDir -split -status -winwidth=30 -toggle -no-quit<CR>
" nnoremap <Leader>E :<C-u>VimFilerCurrentDir -split -status -winwidth=30 -toggle -no-quit<CR>
nnoremap <Leader>e :<C-u>VimFilerBufferDir -split -status -winwidth=30 -toggle -force-quit<CR>
nnoremap <Leader>E :<C-u>VimFilerCurrentDir -split -status -winwidth=30 -toggle -force-quit<CR>

autocmd VimEnter * if !argc() | VimFiler | endif
" autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
autocmd FileType vimfiler nmap <silent><buffer>S <Plug>(vimfiler_toggle_simple_mode)
autocmd FileType vimfiler nnoremap <silent><buffer>i :<C-u>call UniteFileCurrentDir()<CR>
autocmd FileType vimfiler nnoremap <silent><buffer>/ :<C-u>call UniteFileRecCurrentDir()<CR>
autocmd FileType vimfiler nnoremap <silent><buffer>: q:a

function! UniteFileCurrentDir()
    let path = vimfiler#helper#_get_file_directory()
    execute ':Unite file directory -start-insert -path=' . path
endfunction

function! UniteFileRecCurrentDir()
    let path = vimfiler#helper#_get_file_directory()
    execute ':Unite file_rec/async:' . path
    " execute ':Unite file_rec/async:' . path . ' -start-insert'
    echo path
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
"}}}

" neocomplete.vim "{{{
"-------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 20
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 2

let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#auto_complete_delay = 30

let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
" example: 'lang' : 'path to completion dictionary'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

let g:neocomplete#enable_auto_delimiter = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" key mappings "{{{
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd CmdwinEnter * call s:init_cmdwin()
autocmd CmdwinLeave * let g:neocomplete#enable_auto_select = 1

function! s:init_cmdwin()
  let g:neocomplete#enable_auto_select = 0

  nnoremap <buffer><silent> q :<C-u>quit<CR>
  nnoremap <buffer><silent> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> neocomplete#close_popup()."\<CR>"
  inoremap <buffer><expr><C-h> col('.') == 1 ?
        \ "\<ESC>:quit\<CR>" : neocomplete#smart_close_popup()."\<C-h>"
  inoremap <buffer><expr><BS> col('.') == 1 ?
        \ "\<ESC>:quit\<CR>" : neocomplete#smart_close_popup()."\<C-h>"

  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
endfunction"}}}
"}}}

" neosnippet "{{{
"-------------------------------------------------------------
let g:neosnippet#snippets_directory = '~/.vim/snippets/'
" key mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
"}}}

" programing language "{{{
"-------------------------------------------------------------
let g:neoinclude#paths = {
\   'cpp': '/usr/local/opt/boost/include/',
\}
if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1

" c, c++ "{{{
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#delimiter_patterns.cpp = ['::']

autocmd FileType cpp call s:my_cpp_setting()
function! s:my_cpp_setting()
    " setlocal path+=/usr/include/c++/4.2.1,/usr/local/opt/boost/include
    setlocal matchpairs+=<:>
endfunction

" vim-clang
let g:clang_auto = 0
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_c_completeopt = 'menuone'
let g:clang_cpp_completeopt = 'menuone'
let g:clang_diagsopt = ''
let g:clang_verbose_pmenu = 1

" " clang_complete
" autocmd FileType c,cpp setlocal omnifunc=ClangComplete
" let g:clang_complete_auto = 1
" let g:clang_auto_select = 0
" let g:clang_use_library = 1
" let g:clang_user_options = '-std=c++14'
" if has('mac')
"     let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
" endif
"}}}

" python "{{{
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#show_call_signatures = 2
autocmd FileType python setlocal completeopt-=preview
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python =
\   '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" for vim-pyenv
" autocmd FileType python call s:pyenv_setting()
function! s:pyenv_setting()
    let s:anyenv_dir = expand('~/.anyenv')
    let s:pyenv_dir = expand('~/.pyenv')
    if isdirectory(s:anyenv_dir)
        let $PYTHONHOME=$HOME."/.anyenv/envs/pyenv/versions/2.7.11"
        set pythondll=$HOME/.anyenv/envs/pyenv/versions/2.7.11/lib/libpython2.7.dylib
    elseif isdirectory(s:pyenv_dir)
        let $PYTHONHOME=$HOME."/.pyenv/versions/2.7.11"
        set pythondll=$HOME/.pyenv/versions/2.7.11/lib/libpython2.7.dylib
    endif
    py import sys

    if isdirectory(s:anyenv_dir)
        let $PYTHONHOME=$HOME."/.anyenv/envs/pyenv/versions/3.5.1"
        set pythondll=$HOME/.anyenv/envs/pyenv/versions/3.5.1/lib/libpython3.5m.dylib
    elseif isdirectory(s:pyenv_dir)
        let $PYTHONHOME=$HOME."/.pyenv/versions/3.5.1"
        set pythonthreedll=$HOME/.pyenv/versions/3.5.1/lib/libpython3.5m.dylib
    endif
    py3 import sys
endfunction
"}}}
"}}}
