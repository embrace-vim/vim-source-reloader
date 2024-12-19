# Quickly source Vim scripts at runtime 🔃

A classic Vim tip to make it quick and easy to source the Vim script
you're working on.

## Commands

Press `<F9>` to reload the current source file.

- Works from insert and normal modes.

- You can disable one or both commands by
  setting global variables:

  ```
  " Don't define normal mode <F9> command
  let g:vim_source_reloader_disable_normal = 1

  " Don't define insert mode <F9> command
  let g:vim_source_reloader_disable_insert = 1
  ```

## Usage Tip

Oftentimes, you'll see code atop a Vim plugin that prevents that
script from being sourced twice. E.g., perhaps you've see code like
this:

  ```
  if exists("g:loaded_source_reloader") || &cp
    finish
  endif
  let g:loaded_source_reloader = 1
  ```

Such code inhibits this plugin (and the `:source` command) from
reloading those scripts.

But there are a few ways to get around the guard clause so you can
reload the file at runtime after you've made changes to it. (Skip to
the [third option](#user-content-option-3--automatically-unlet-the-gvar)
for possibly the best approach.)

### Option 1 — Unlet the `g:var`

One option is to unlet the variable, either manually or by adding
an unlet before the finish guard, e.g.:

  ```
  " Uncomment the unlet to :source this file again at runtime.
  unlet g:loaded_source_reloader = 1

  if exists("g:loaded_source_reloader") || &cp
    finish
  endif
  let g:loaded_source_reloader = 1
  ```

### Option 2 — Disable the `finish`

Another option is to (temporarily) remove or comment out the finish, e.g.,

  ```
  if exists("g:loaded_source_reloader") || &cp
    " Comment the finish (temporarily) to reload this file at runtime.
    "finish
  endif
  let g:loaded_source_reloader = 1
  ```

### Option 3 — Automatically unlet the `g:var`

A third option works automatically by checking `<sfile>`, e.g.,

  ```
  if expand("%:p") ==# expand("<sfile>:p")
    unlet g:loaded_source_reloader
  endif

  if exists("g:loaded_source_reloader") || &cp
    finish
  endif
  let g:loaded_source_reloader = 1
  ```

(Props to [`EasyMotion`](https://github.com/easymotion/vim-easymotion)
for this approach — it's the only source file this author has seen
that does it like that. So *savvy!*)

## Shout-Outs

The original tip may be from the venerable Luc Hermitte, who commented
on it, but the Wiki shows it was originally posted by *127.0.0.1*.

- _Source current file when editing a script_

   http://vim.wikia.com/wiki/Source_current_file_when_editing_a_script

## Caveats

Be aware that calling `:source` will not always work!

You might see errors if your source code is not reentrant.

For instance:

- Be sure to use `function!`, with the bang, to overwrite existing
  functions of the same name.

- Be sure to use `augroup | au! ...` to recreate _autocommands_.

- Be sure to avoid duplicate command maps, e.g., call `unmap` or
  `nnoremap`.

## Installation

Take advantage of Vim's packages feature
([`:h packages`](https://vimhelp.org/repeat.txt.html#packages))
and install under `~/.vim/pack`, e.g.,:

  ```shell
  mkdir -p ~/.vim/pack/embrace-vim/start
  cd ~/.vim/pack/embrace-vim/start
  git clone https://github.com/embrace-vim/vim-source-reloader.git

  " Build help tags
  vim -u NONE -c "helptags vim-source-reloader/doc" -c q
  ```

- Alternatively, install under `~/.vim/pack/embrace-vim/opt` and call
  `:packadd vim-source-reloader` to load the plugin on-demand.

For more installation tips — including how to easily keep the
plugin up-to-date — please see [`INSTALL.md`](INSTALL.md).

## Attribution

The [`embrace-vim`][embrace-vim] logo by [`@landonb`][@landonb] contains
[coffee cup with straw by farra nugraha from Noun Project](https://thenounproject.com/icon/coffee-cup-with-straw-6961731/) (CC BY 3.0).

[embrace-vim]: https://github.com/embrace-vim
[@landonb]: https://github.com/landonb

