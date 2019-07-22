nmap <silent> <C-e>j <Plug>(ale_next_wrap)
nmap <silent> <C-e>k <Plug>(ale_previous_wrap)

let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters = {
  \ 'html': [],
\}
let g:ale_fixers = {
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'vue': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['prettier-eslint', 'prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'css': ['prettier'],
  \ 'less': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'python': ['autopep8'],
\}

" ファイル保存時に実行
let g:ale_fix_on_save = 1

" ローカルの設定ファイルを考慮する
let g:ale_javascript_prettier_use_local_config = 1
