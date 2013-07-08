function Tab_Or_Complete()
    return "\<C-N>"
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
    else
      return "\<Tab>"
    endif
endfunction
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"
syntax on
filetype plugin on
filetype indent plugin on
set ofu=syntaxcomplete#Complete
set number
set showcmd
syntax on
set shiftwidth=2
set tabstop=2
set expandtab
colorscheme jellybeans
"inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
