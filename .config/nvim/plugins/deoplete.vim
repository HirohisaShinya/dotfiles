"let g:deoplete#enable_at_startup = 1
"
"" <TAB>: completion.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ deoplete#manual_complete()
"
"function! s:check_back_space() abort "{{{
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}
"
"" <S-TAB>: completion back.
"inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
"
"inoremap <expr><CR>
"      \ (pumvisible() && neosnippet#expandable()) ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
"
"" <BS>: close popup and delete backword char.
"inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"
"" <CR>: close popup and save indent
"" inoremap <silent><CR> <C-r>=<SID>my_cr_function()<CR>
"
"function! s:my_cr_function() abort
"  return deoplete#cancel_popup()
"endfunction
"
"" let g:deoplete#enable_refresh_always = 0
"let g:deoplete#enable_camel_case = 1
"
"
"" color
"autocmd VimEnter * hi Pmenu guifg=#ffffff guibg=#000022
"autocmd VimEnter * hi PmenuSel guifg=#ff99ee guibg=#000044
