" Map leader enter to redraw screen
nmap <leader><cr> :redraw!<CR>

" Map jj to escape
inoremap jj <Esc>
inoremap jk <Esc>:w<cr>

" Go to previous file with backspace
nnoremap <BS> <c-^>

" Open zsh terminal in vertical or horizontal split
nmap <silent> <Leader>tv :vs term://zsh<CR>
nmap <silent> <Leader>th :sp term://zsh<CR>

" Escape to exit to normal mode in terminal
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" Escape to clear highlighting in normal mode
nnoremap <silent> <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Search for visually selected word with //
vnoremap // y/<C-R>"<CR>``

" Search word under cursor without moving the cursor
nnoremap * *``
nnoremap # #``

" grep word under cursor and populate quickfix window
nnoremap <localleader>t :grep -r <C-R><C-W> ./src<CR><CR>:copen<CR><CR>

" Split panes" (create with :vs)
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

nmap <unique> <leader>r <Plug>NetrwRefresh

" Yank to end of line
map Y y$

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" go to tag
nmap <leader>gd <C-]>

" netrw
" opens netrw in the current window
nmap <localleader>e :Explore<cr>
" opens netrw in a horizontal split
nmap <localleader>x :Sexplore<cr>
" opens netrw in a vertical split
nmap <localleader>v :Vexplore<cr>

"Easily edit the macro stored at register q
nnoremap <leader>q :<c-u><c-r><c-r>='let @q = '. string(getreg('q'))<cr><c-f><left>

" vim:foldmethod=marker:foldlevel=0
