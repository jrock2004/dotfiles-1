" Keymap

" Open Vimrc in split
nnoremap <leader>ve :vsplit $MYVIMRC<CR>

" Source Vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>

" Use jj as escape
inoremap jj <Esc>

" Yank to end of line
nnoremap Y y$

" Yank all matches
nnoremap <leader>Y :CopyMatches<CR>

" Update and go to previous file with backspace
nnoremap <BS> :update<CR><c-^>

" Open previous file in vertical split with shift backspace
nnoremap <leader><BS> :vsp<CR><c-^>

" Close and update buffer
nnoremap <leader>q ZZ<C-w><C-p>

" Toggle QuickFixList
"nnoremap <silent> <localleader>l :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> <localleader><cr> :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> §<cr> :call ToggleList("Quickfix List", 'c')<CR>

" Update current buffer and close it without saving (needed to close terminal buffers)
nnoremap <silent> <leader>dd :update<bar>:bd!<CR>

" Update and close buffer, keep window open and switch to previous file
nnoremap <silent> <leader>df :update<bar>:lclose<bar>b#<bar>bd! #<CR>

" Update current buffer and close all other buffer
nnoremap <silent> <leader>d<CR> :wa<bar>%bd!<bar>e#<bar>bd#<CR>

" Write buffer and close window
nnoremap <leader>w :update<CR>

" Refresh buffer
nnoremap <leader>e :e<CR>

" Close all other wndows
nnoremap <leader>do :only<CR>

" Move window to new tab
nnoremap <leader>tt <C-w>T

" Use light theme
nnoremap <leader>tl :colorscheme morning<CR>

" Use dark theme
nnoremap <leader>td :colorscheme dracula<CR>

" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Escape to clear highlighting in normal mode
nnoremap <silent> <esc> :nohlsearch<return><esc>
nnoremap <esc>^[ <esc>^[

" Tabs {{{
" New tab
nnoremap <leader>tn :tabnew<CR>

" Previous tab (override unimpaired jump to next tag)
nnoremap <silent> [t :tabp<CR>

" Next tab (override unimpaired jump to previous tag)
nnoremap <silent> ]t :tabn<CR>
" }}}
" Macros {{{
" Easily edit the macro stored at register q
nnoremap <leader>mq :<C-U><C-R><C-R>='let @q = '. string(getreg('q'))<CR><C-F><left>

" Run macro over selected rows using @
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" }}}
" Movement {{{
" Emacs style movement in commandline (as in bash or Zsh)
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>

" Move to end of line
nnoremap L $
nnoremap L $
onoremap L $

" Move to start of line
nnoremap H ^
vnoremap H ^
onoremap H ^

nnoremap <leader>h }k_
vnoremap <leader>h }k_

nnoremap <leader>y {j_
vnoremap <leader>y {j_
" }}}
" Terminal {{{
nnoremap <silent> <Leader>t<Leader> :te<CR>

" Escape to exit to normal mode in terminal
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>
" }}}
" Splits {{{
" Move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" Open file under cursor in vertical split
nnoremap <C-w>f :vertical wincmd f<CR>
" }}}
" Netrw {{{
" opens netrw in the current window
"nnoremap <localleader>e :Explore<CR>
" opens netrw in a horizontal split
"nnoremap <localleader>x :Sexplore<CR>
" opens netrw in a vertical split
"nnoremap <localleader>v :Vexplore<CR>

" Refresh netrw directory listing using <C-l>
" }}}
" Folds {{{
" Navigate between closed folds
nnoremap <silent> zn :call NextClosedFold('j')<CR>
nnoremap <silent> zN :call NextClosedFold('k')<CR>
" }}}
" Grep / Search  {{{
" Regular grep
" nnoremap <leader>h :silent grep! -R  .<left><left>

vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

" Grep word under cursor: (from Learn Vimscript the hard way:
" http://learnvimscriptthehardway.stevelosh.com/chapters/32.html)
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<CR>:copen<CR>
nnoremap <silent> <leader>g :call SearchAndGrep("normal", 0)<CR>
vnoremap <silent> <leader>g :<c-u>call SearchAndGrep(visualmode(), 0)<CR>

nnoremap <silent> <leader>l :call SearchAndGrep("normal", 1)<CR>
vnoremap <silent> <leader>l :<c-u>call SearchAndGrep(visualmode(), 1)<CR>

" Search for selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <silent><leader><CR> :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

" augroup SearchOnEnter
"     autocmd!
"     autocmd FileType tsx,ts,js,css,scss,less,html,xhtml,vim nnoremap <buffer><silent><leader><CR> :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
" augroup END
" }}}
" Substitute {{{
nnoremap c* *``cgn
nnoremap c# *``cgN

nnoremap d* *``dgn
nnoremap d# *``dgN

nnoremap <C-space> :call SubstituteWordOrSelection("normal")<CR>
vnoremap <C-space> :<c-u>call SubstituteWordOrSelection(visualmode())<CR>

nnoremap <leader>s :cfdo %s///c \| update<left><left><left><left><left><left><left><left><left><left><left>
" }}}
" Custom Commands {{{
nnoremap <silent> <leader>ck :MarkToSqash<cr>
nnoremap <silent> <leader>cl :CleanCommit<cr>
" }}}
