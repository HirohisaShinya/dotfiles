if !&compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/dein_filetype.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:coc_global_extensions = [
      \'coc-css',
      \'coc-cssmodules',
      \'coc-dictionary',
      \'coc-eslint',
      \'coc-explorer',
      \'coc-git',
      \'coc-html',
      \'coc-json',
      \'coc-lists',
      \'coc-prettier',
      \'coc-stylelint',
      \'coc-svg',
      \'coc-spell-checker',
      \'coc-tsserver',
      \'coc-yaml',
\]

filetype plugin indent on
syntax enable

runtime! color.vim
runtime! option.vim
runtime! keymap.vim
runtime! command.vim
