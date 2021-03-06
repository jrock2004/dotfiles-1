" Plugins {{{
" Bootstrap Plug
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andymass/vim-matchup'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': []}
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'google/vim-searchindex'
Plug 'justinmk/vim-dirvish'
Plug 'romainl/vim-qlist'
Plug 'romainl/vim-qf'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'meain/vim-package-info', { 'do': 'npm install' }


" Syntax highlight
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css'] }
Plug 'jparise/vim-graphql'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'nvim-treesitter/nvim-treesitter'


" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryuta69/elly.vim'
Plug 'jonwalstedt/vim-myhelp'
call plug#end()
"}}}

" Plugin settings
" FZF Fuzzyfinder {{{
command! -bar -bang Snippets call fzf#vim#snippets({'options': '-n ..'}, <bang>0)
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse --margin=1,2'
" let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

nnoremap <silent> <C-p> :call FZFWithDevIcons()<CR>
nnoremap <silent> <leader>p :Buffers<CR>
nnoremap <silent> <leader>ff :Ag<CR>
nnoremap <silent> <leader>hh :History:<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fg :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>fd :BD<CR>
" inoremap <silent> <c-space> <esc>:Snippets<CR>

imap <c-f> <plug>(fzf-complete-path)
imap <c-l> <plug>(fzf-complete-line)

" }}}
" GitGutter {{{
"disable keybindings (causes delay on mapped easymotion keys)
let g:gitgutter_map_keys = 0
hi GitGutterAddLine guifg=white guibg=springgreen4 gui=NONE
hi GitGutterChangeLine guifg=#ffffff guibg=lightseablue gui=NONE
hi GitGutterDeleteLine guifg=#ff0101 guibg=firebricks gui=NONE
hi GitGutterChangeDeleteLine guifg=#000000 guibg=#ffb733 gui=NONE

nnoremap <silent> <leader>nn :GitGutterNextHunk<CR>
nnoremap <silent> <leader>np :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>nf :GitGutterFold<CR>
nnoremap <silent> <leader>nq :GitGutterQuickFix<CR>
" }}}
" Vim Fugitive {{{
function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    Gstatus
  endif
endfunction

command! ToggleGStatus :call ToggleGStatus()

" Fugitive (toggle git status panel)
nnoremap <silent> <localleader><space> :call ToggleGStatus()<cr>
nnoremap <silent> §<space> :call ToggleGStatus()<cr>
nnoremap <localleader>v :Gvdiffsplit<CR>
nnoremap <localleader>l :Glog -10 -- %<CR>
"}}}
" gv.vim  {{{
command! GV call plug#load('vim-fugitive', 'gv.vim') | GV
"}}}
" Dirvish  {{{
let g:dirvish_mode = ':sort ,^.*[\/],'
let g:loaded_netrwPlugin = 0

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
  autocmd FileType dirvish silent! unmap <buffer> <C-n>
augroup END

nmap <leader>f<CR> Z!
" }}}
" Sneak {{{
let g:sneak#s_next = 0
let g:sneak#use_ic_scs = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

" visual-mode
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S

" operator-pending-mode
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

autocmd ColorScheme * hi! Sneak guifg=black guibg=aqua ctermfg=black ctermbg=green
"}}}
"EasyMotion {{{
"Disable default mappings
let g:EasyMotion_do_mapping = 0

"Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"keep cursor column when JK motion
let g:EasyMotion_startofline = 0

"Use upper target labels and type as a lower case
"let g:EasyMotion_use_upper = 1

let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwy'

"JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
" }}}
" Coc {{{
let g:coc_global_extensions = ['coc-lists', 'coc-json', 'coc-tsserver', 'coc-prettier', 'coc-html', 'coc-jest', 'coc-ultisnips', 'coc-css', 'coc-eslint', 'coc-go', 'coc-actions', 'coc-yaml', 'coc-emmet']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'

" Use enter to confirm complete

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> for trigger completion.
inoremap <silent><expr> <C><space> coc#refresh()

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>ft <Plug>(coc-type-definition)
nmap <silent> <leader>fi <Plug>(coc-implementation)
nmap <silent> <leader>fr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup coc
  autocmd!
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,javascript setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

command! -nargs=0 Tsc :call CocAction('runCommand', 'tsserver.watchBuild')
" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Outline document
nnoremap <silent> <leader>cp  :<C-u>CocList outline<cr>
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" }}}
" Matchup {{{
let g:matchup_motion_keepjumps='true'
"}}}
" Vim QF {{{
let g:qf_mapping_ack_style = 1
nmap <leader>fq <Plug>(qf_qf_toggle)
" }}}
" Treesitter and theme setup {{{
" lua << EOF
" require'nvim-treesitter.configs'.setup {
" ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
" highlight = {
"   enable = true,              -- false will disable the whole extension
"   disable = {},  -- list of language that will be disabled
" },
" }
" EOF
"
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
"}}}
" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<Nop>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
" Jump to next/previous placeholder.
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}
