" SuperRetab {{{
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
"}}}
" Vim Profiler {{{
command! ProfileMe :profile start profile.log <bar> profile func * <bar> profile file *
command! ProfileStop :profile pause
"}}}
" Highlights {{{
function! MyHighlights() abort
  highlight VertSplit ctermbg=235 ctermfg=236
  highlight LineNr ctermfg=darkgrey
  highlight NonBreakingSpace ctermbg=red guibg=red
  match NonBreakingSpace / / " (CTRL+V x a 0)
endfunction

augroup highlights
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup end
" }}}
" vim:foldmethod=marker:foldlevel=0
