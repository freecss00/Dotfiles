if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

augroup cpp-path
    autocmd!
    if has('win32') || has('win64')
        let $VIM_CPP_STDLIB = ""
        let $VIM_INCLUDE_DIR = ""
    else if has('mac')
        let $VIM_CPP_STDLIB = "/usr/local/Cellar/gcc6/6.1.0/lib/gcc/6"
        let $VIM_INCLUDE_DIR = "/usr/local/Cellar/boost/1.60.0_2/include/boost"
    else
        let $VIM_CPP_STDLIB = "/usr/include,/usr/local/include"
        let $VIM_INCLUDE_DIR = ""
    setlocal path += $VIM_CPP_STDLIB
    setlocal path += $VIM_INCLUDE_DIR
augroup END

"vim-clang "{{{
" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

if executable('clang-3.6')
    let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
    let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
    let g:clang_exec = 'clang-3.4'
else
    let g:clang_exec = 'clang'
endif

if executable('clang-format-3.6')
    let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
    let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
    let g:clang_format_exec = 'clang-format-3.4'
else
    let g:clang_exec = 'clang-format'
endif

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
"}}}
