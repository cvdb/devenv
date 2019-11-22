vnoremap . :norm.<CR>
vmap <C-w> :normal @w<CR>
nnoremap n nzz
nnoremap N Nzz
set hlsearch
set incsearch
set relativenumber
set cursorline
set guicursor=
set foldenable                                      "enable folds by default
set foldmethod=syntax                               "fold via syntax of files
set foldlevelstart=99                               "open all folds by default
let g:xml_syntax_folding=1                          "enable xml folding
set number
set scrolloff=15
syntax on
set background=dark
colorscheme PaperColor 
let g:airline_theme = 'term'
let g:airline#extensions#tabline#enabled = 1 	   " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'   " Show just the filename 

autocmd BufWritePre *.js :normal gg=G
autocmd BufWritePre *.ts :normal gg=G

let g:deoplete#enable_at_startup = 1

let mapleader = "\<Space>"
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
set expandtab
set shiftwidth=2
set softtabstop=2

" let g:ale_linters = { 'java': [], }

"-- snipts settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

highlight Search     cterm=bold ctermfg=208 ctermbg=234 guifg=Blue guibg=Yellow cterm=underline
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

highlight ALEError ctermbg=240
highlight ALEWarning ctermbg=234
highlight ALEErrorSign ctermfg=124 ctermbg=240
highlight ALEWarningSign ctermfg=130 ctermbg=236

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=236

call plug#begin()

Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'elzr/vim-json'
Plug 'Chiel92/vim-autoformat'
Plug 'leafgarland/typescript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'matze/vim-move'
Plug 'tomasr/molokai'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'chrisbra/NrrwRgn'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'trevordmiller/nova-vim'
Plug 'tmhedberg/matchit'
Plug 'easymotion/vim-easymotion'
Plug 'gnattishness/cscope_maps'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'artur-shaik/vim-javacomplete2'

call plug#end()


"--------------  EASYMOTION ---------------------------------------------

" Disable default mappings
let g:EasyMotion_do_mapping = 0 

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

highlight EasyMotionMoveHLDefault cterm=bold ctermfg=208 ctermbg=234 guifg=Blue guibg=Yellow cterm=underline
let g:EasyMotion_do_shade = 0
highlight EasyMotionTargetDefault 		ctermfg=205 cterm=bold
highlight EasyMotionTarget 			ctermfg=205 cterm=bold
highlight EasyMotionTarget2FirstDefault 	ctermfg=205 cterm=bold
highlight EasyMotionTarget2First 		ctermfg=205 cterm=bold
highlight EasyMotionTarget2SecondDefault 	ctermfg=205 cterm=bold
highlight EasyMotionTarget2Second 		ctermfg=205 cterm=bold
"--------------  EASYMOTION ---------------------------------------------

" FZF & ag
function! s:root()
  return systemlist('git rev-parse --show-toplevel')[0]
endfunction

function! s:with_git_root()
  return v:shell_error ? {} : {'dir': s:root()}
endfunction

let g:fzf_layout = { 'down': '~40%' }

function! s:file_names()
   call fzf#vim#files(s:root(), g:fzf_layout)
endfunction

"use when output contains file path and position in file
function! s:ag_custom(args)
  call fzf#vim#grep('ag --nogroup --column --color '.a:args, 1, extend(s:with_git_root(), g:fzf_layout))
endfunction

autocmd VimEnter * command! -nargs=* -bang FindByFileNames call s:file_names()
autocmd VimEnter * command! -nargs=* -bang AgCustom call s:ag_custom(<q-args>)

" find word under cursor
nnoremap <C-k> :AgCustom <C-R><C-W><CR>

" find word typed in.
nnoremap <F3> :AgCustom <Space>

" find word typed in match file names only.
nnoremap <C-f> :FindByFileNames <CR>

" find open buffer
nnoremap <F4> :Buffers <CR>



function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
nnoremap yy yy:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p



