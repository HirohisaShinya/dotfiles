autocmd FileType defx call s:defx_my_settings()
noremap <F5> :<C-u>Defx -split="vertical" -toggle -winwidth="50" -direction="topleft" -auto-cd -columns="icons:filename:type"<CR>

function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
		\ defx#is_directory() ?
		\ defx#do_action('open_or_close_tree') :
		\ defx#do_action('drop')
  nnoremap <silent><buffer><expr> o
		\ defx#is_directory() ?
		\ defx#do_action('open_or_close_tree') :
		\ defx#do_action('drop')
  nnoremap <silent><buffer><expr> C
		\ defx#do_action('open_directory')
  nnoremap <silent><buffer><expr> yy
    \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
    \ defx#is_directory() ?
    \ defx#do_action('open_or_close_tree') :
    \ defx#do_action('multi', [['drop', 'vsplit']])
  nnoremap <silent><buffer><expr> h
    \ defx#is_opened_tree() ?
    \ defx#do_action('close_tree') :
    \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> i
    \ defx#do_action('multi', [['drop', 'split']])
  nnoremap <silent><buffer><expr> s
    \ defx#do_action('multi', [['drop', 'vsplit']])
  nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> <C-y>
    \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> I
    \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> u
    \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
endfunction
