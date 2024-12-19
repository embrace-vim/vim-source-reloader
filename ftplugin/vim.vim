" vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Author: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/embrace-vim/vim-source-reloader#🔃
" License: https://creativecommons.org/publicdomain/zero/1.0/
" Summary: Wires <F9> commands to reload the current source file.

" -------------------------------------------------------------------

" Note this ftplugin is sourced frequently, so it doesn't use a finish guard.
" - E.g., you'd see it sourced right now if you ran `set ft=vim`.

" -------------------------------------------------------------------

" Press <F9> to source the Vim file being edited. (#reload)

function! s:CreateMap_NormalMode_F9() abort
  if exists('g:vim_source_reloader_disable_normal') && g:vim_source_reloader_disable_normal

    return
  endif

  nnoremap <silent> <buffer> <F9> :exec 'source '.bufname('%')<CR>
endfunction

function! s:CreateMap_InsertMode_F9() abort
  if exists('g:vim_source_reloader_disable_insert') && g:vim_source_reloader_disable_insert

    return
  endif

  inoremap <silent> <buffer> <F9> <C-O>:exec 'source '.bufname('%')<CR>
endfunction

call s:CreateMap_NormalMode_F9()
call s:CreateMap_InsertMode_F9()

