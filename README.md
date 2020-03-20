# vim-source-reloader

A classic Vim tip, packaged for easy [installation](#installation) to `~/.vim/pack`.

- [*"Source current file when editing a script"*](http://vim.wikia.com/wiki/Source_current_file_when_editing_a_script).

## Commands

Press `<F9>` to reload the current source file.

## Usage Tip

I like to include the following boilerplate atop each source to remind
myself how to reload the file.

  ```vim
  " YOU: Uncomment the 'unlet', then <F9> to reload this file.
  "       https://github.com/landonb/vim-source-reloader
  "  silent! unlet g:loaded_foo_bar

  if exists("g:loaded_foo_bar") || &cp
    finish
  endif
  let g:loaded_foo_bar = 1
  ```

Note that this will not always work! You might see errors if your
source code is not reentrant, e.g., you'll want to use `function!`,
`augroup | au! ...`, etc., to ensure your code can be re-sourced
without complaint.

## Installation

Take advantage of Vim's packages feature (`:h packages`), e.g.,:

  ```shell
  mkdir -p ~/.vim/pack/landonb/start
  cd ~/.vim/pack/landonb/start
  git clone https://github.com/landonb/vim-source-reloader.git
  vim -u NONE -c "helptags vim-source-reloader/doc" -c q
  ```

To load the plugin manually, install to
`~/.vim/pack/landonb/opt` instead and call
`:packadd vim-source-reloader` when ready.

## License

Copyright (c) Landon Bouma. This work is distributed
wholly under CC0 and dedicated to the Public Domain.

https://creativecommons.org/publicdomain/zero/1.0/

