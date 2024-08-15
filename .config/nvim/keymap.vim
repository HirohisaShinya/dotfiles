" 移動
noremap j gj
noremap k gk

noremap <C-l> $
noremap <C-h> ^

noremap <C-j> <C-d>
noremap <C-k> <C-u>

nnoremap ; :

" esc.
nnoremap <C-Space> <esc>
inoremap <silent> <C-Space> <esc>:set iminsert=0<CR>
vnoremap <C-Space> <esc>
nnoremap <ESC><ESC> :nohlsearch<enter>

" if has('mac')
"   inoremap <silent> <C-Space> <esc>:call system(g:imeoff)<CR>
" else
"   inoremap <silent> <C-Space> <esc>:set iminsert=0<CR>
" endif


" insert mode.
inoremap <silent> <esc> <esc>:set iminsert=0<CR>

" visual mode
vnoremap <C-l> $h
vnoremap ) t)
vnoremap ( t(

" 置換.
nnoremap <s-f> :%s///gc<left><left><left><left>
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
vnoremap /gr "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>/<C-R>=escape(@x, '\\/.*$^~[]')<CR>/gc<Left><Left><Left>

" text object.
nmap "" vi"
nmap '' vi'
nmap (( vi(
nmap {{ vi{
nmap [[ vi[

nmap yp :let @* = expand('%:p')<CR>
nmap yh :let @* = expand('%:h')<CR>
nmap yt :let @* = expand('%:t')<CR>
