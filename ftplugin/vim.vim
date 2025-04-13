" vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Author: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/embrace-vim/vim-source-reloader#🔃
" License: https://creativecommons.org/publicdomain/zero/1.0/
" Summary: Wires <F9> commands to reload the current source file.

" -------------------------------------------------------------------

" Note this ftplugin is sourced frequently, so it doesn't use a finish guard.
" - E.g., you'd see it sourced right now if you ran `set ft=vim`.

" -------------------------------------------------------------------

" Press <F9> to source the Vimscript or Lua file being edited. (#reload)

function! s:CreateMap_ReloadConfig_F9() abort
  if has('nvim')
    lua << EOF
      vim.keymap.set({ "n", "i" }, "<F9>", function()
        local ext = vim.fn.expand("%:e")
        if ext == "lua" then
          vim.cmd([[luafile %]])
        elseif ext == "vim" then
          vim.cmd([[exec "source " .. bufname("%")]])
        else
          print("Cannot reload unknown file type: " .. ext)
        end
      end, { desc = "Reload Luafile/Vimscript", noremap = true, silent = true })
EOF
  else
    nnoremap <silent> <buffer> <F9> :call <SID>SourceBuffer()<CR>
    inoremap <silent> <buffer> <F9> <C-O>:call <SID>SourceBuffer()<CR>
  endif
endfunction

function! s:SourceBuffer() abort
  if expand("%:e") == "vim"
    exec 'source ' .. bufname('%')
  else
    echom "Cannot reload unknown file type: " .. expand("%:e")
  endif
endfunction

call s:CreateMap_ReloadConfig_F9()

