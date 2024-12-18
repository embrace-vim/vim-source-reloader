" <F9> Mapping to reload the current source file.
" Copier: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/landonb/vim-source-reloader
" License: https://creativecommons.org/publicdomain/zero/1.0/
" vim:tw=0:ts=2:sw=2:et:norl:ft=vim

" -------------------------------------------------------------------

" Note this ftplugin is sourced frequently, so don't use finish guard.
" - E.g., on `set ft=vim`.
"
" if exists("g:loaded_vim_source_reloader_after_vim") || &cp
"   finish
" endif
" let g:loaded_vim_source_reloader_after_vim = 1

" -------------------------------------------------------------------

" USAGE: Open a Vim plugin file, then press F9 to source (reload) the code.

" CONVENTION: Oftentimes, you'll see atop a Vim plugin some code that prevents
" itself from being sourced twice, by calling `finish` if it senses a variable
" having been set. E.g., perhaps you'd see code this like:
"
"     if exists("g:loaded_source_reloader") || &cp
"       finish
"     endif
"     let g:loaded_source_reloader = 1
"
" To work around such a guard clause so that <F9> works to reload the file,
" you can add boilerplate above the guard clause that a developer can enable
" (at the time they want to develop) by uncommenting a `let` statement that
" will allow the guard clause variable to be reset. E.g., something like this:
"
"     " YOU: 1.) Uncomment the `let` to enable this feature; then
"     "      2.) Use <F9> to reload this script.
"     "      - HINT: <F9> defined by: landonb/dubs_ftype_mess or run:
"     "        noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>
"     "
"     "  let s:reloadable = 1
"     if exists("s:reloadable") && s:reloadable &&
"         \ exists("g:loaded_vim_select_mode_stopped_down")
"       unlet g:loaded_vim_select_mode_stopped_down
"     endif
"
"     if exists("g:loaded_source_reloader") || &cp
"       finish
"     endif
"     let g:loaded_source_reloader = 1

" -------------------------------------------------------------------

" Copied from the excellent tip:
" - "Source current file when editing a script"
"   http://vim.wikia.com/wiki/Source_current_file_when_editing_a_script
" Original author: Luc Hermitte, though possibly anonymous (127.0.0.1).

" Press F9 to source the Vim file being edited. (#reload)
noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>

