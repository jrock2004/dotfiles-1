local cmd = require 'lua-helpers/command'
local command = cmd.command

-- Lsp
command([[LspReload]], [[lua require'lsp_config'.lsp_reload(0)]])
command([[LspStop]], [[lua require'lsp_config'.lsp_stop(0)]])
command([[LspClearDiagnostics]], [[lua vim.lsp.diagnostic.clear(0)]])
command([[LspPrint]], [[lua print(vim.inspect(vim.lsp.buf_get_clients()))]])

-- Profiling
command([[ProfileMe]], [[profile start profile.log <bar> profile func * <bar> profile file *]])
command([[ProfileStop]], [[profile pause]])

-- Misc
-- execute shell script in file
command([[Exec]], [[set splitright | vnew | set filetype=sh | read !sh #]])
-- copy buffer file path
command([[CopyBufferPath]],[[:let @+ = expand('%:p')]])

command([[BD]], [[call fzf#run(fzf#wrap({ 'source': CustomFZF#Bufs(), 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) }, 'options': '--multi --reverse --bind ctrl-a:select-all+accept' }))]])
command([[Ag]],[[:call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)]])

-- Git
command([[ToggleGStatus]], [[call CustomFugitive#ToggleGStatus()]])
command([[GV]],[[call plug#load('vim-fugitive', 'gv.vim') | GV]])
command([[GitFileHistory]],[[call plug#load('vim-fugitive') | 0Gclog]])
command([[GFileHistory]],[[call plug#load('vim-fugitive') | 0Gclog]])
command([[GitDiffWithHash]], [[call plug#load('vim-fugitive') | call CustomFugitive#DiffFileWithHash()]])
command([[GDiffWithHash]], [[call plug#load('vim-fugitive') | call CustomFugitive#DiffFileWithHash()]])

-- Note taking
command([[NotesBrowse]],[[:call Notes#Browse()]])
command([[NotesTODO]],[[:call Notes#Todo()]])
command([[NoteCreate]],[[:call Notes#Create()]])
