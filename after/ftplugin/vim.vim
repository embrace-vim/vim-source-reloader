" <F9> Mapping to reload the current source file.
" Copier: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/landonb/vim-source-reloader
" License: https://creativecommons.org/publicdomain/zero/1.0/

" Copied from the excellent tip:
" - "Source current file when editing a script"
"   http://vim.wikia.com/wiki/Source_current_file_when_editing_a_script
" Original author: Luc Hermitte, though possibly anonymous (127.0.0.1).

" YOU: Uncomment the 'unlet', then <F9> to reload this file.
"       https://github.com/landonb/vim-source-reloader
"  silent! unlet g:loaded_source_reloader

if exists("g:loaded_source_reloader") || &cp
  finish
endif
let g:loaded_source_reloader = 1

" Press F9 to source the Vim file being edited. (#reload)
noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>

