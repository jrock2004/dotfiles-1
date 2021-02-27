vim.cmd[[augroup highlight_yank]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()]]
vim.cmd[[augroup END]]

vim.cmd[[augroup xresources]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %]]
vim.cmd[[augroup END]]

vim.cmd[[augroup terminal]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd TermOpen * setlocal nonumber | setlocal signcolumn=no]]
vim.cmd[[augroup END]]

vim.cmd[[augroup open_in_split_from_qf]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd FileType qf nmap <buffer> <leader><Enter> <C-w><Enter><C-w>L]]
vim.cmd[[augroup END]]

vim.cmd[[augroup bwc_create_dir]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd BufWritePre * :call Folders#MkNonExDir(expand('<afile>'), +expand('<abuf>'))]]
vim.cmd[[augroup END]]

vim.cmd[[augroup dirvish_config]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd FileType dirvish silent! unmap <buffer> <C-p>]]
  vim.cmd[[autocmd FileType dirvish silent! unmap <buffer> <C-n>]]
vim.cmd[[augroup END]]

vim.cmd[[augroup sneak]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd ColorScheme * hi! Sneak guifg=black guibg=aqua ctermfg=black ctermbg=green]]
vim.cmd[[augroup END]]

vim.cmd[[augroup formatting_sync]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd BufWritePost * silent! lua vim.lsp.buf.formatting_async()]]
vim.cmd[[augroup END]]

