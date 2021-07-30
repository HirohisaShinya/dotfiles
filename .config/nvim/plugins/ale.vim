"nmap <silent> <C-e>j <Plug>(ale_next_wrap)
"nmap <silent> <C-e>k <Plug>(ale_previous_wrap)
"
"let g:ale_sign_error = '⨉'
"let g:ale_sign_warning = '⚠'
"
"let g:ale_statusline_format = ['⨉%d', '⚠%d', 'OK']
"let g:ale_echo_msg_format = '[%linter%] %s'
"
"let g:ale_linters = {
"  \ 'html': []
"\}
"let g:ale_fixers = {
"  \ 'c': ['clang-format'],
"  \ 'cpp': ['clang-format'],
"  \ 'vue': ['eslint'],
"  \ 'javascript': ['prettier-eslint', 'prettier', 'eslint'],
"  \ 'typescript': ['prettier-eslint', 'prettier', 'eslint'],
"  \ 'json': ['prettier'],
"  \ 'css': ['prettier', 'stylelint'],
"  \ 'less': ['prettier'],
"  \ 'scss': ['prettier'],
"  \ 'python': ['autopep8'],
"\}
"
"let g:ale_sign_column_always = 1
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 0
"let g:ale_keep_list_window_open = 0
"
"" 余分な空白があるときは警告表示
"let b:ale_warn_about_trailing_whitespace = 0
"
"" ファイル保存時に実行
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_fix_on_text_changed = 'never'
"let g:ale_lint_on_save = 1
"let g:ale_fix_on_save = 0
"
"" ローカルの設定ファイルを考慮する
"let g:ale_javascript_eslint_use_global = 1
"let g:ale_javascript_prettier_use_local_config = 1
