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
set wrap
set linebreak
set showcmd
syntax on
set shiftwidth=2
set tabstop=2
set expandtab
colorscheme jellybeans
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set laststatus=2
map gf :e <cfile><cr>
"inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
let g:airline_theme             = 'badwolf'
let g:airline_enable_branch     = 2
let g:airline_enable_syntastic  = 1

" vim-powerline symbols
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = ''
