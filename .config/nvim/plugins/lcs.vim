set hidden
let g:LanguageClient_serverCommands = {
  \'vue': ['vls'],
  \'rust': ['rls'],
\}
nnoremap <F6> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <F3> :call LanguageClient#textDocument_formatting()<CR>
