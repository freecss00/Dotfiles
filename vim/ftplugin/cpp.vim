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
        let $VIM_CPP_STDLIB = "/usr/local/Cellar/gcc6/6.1.0/lib/gcc/6"
        let $VIM_CPP_STDLIB = ""
    setlocal path += $VIM_CPP_STDLIB . $VIM_INCLUDE_DIR
augroup END


