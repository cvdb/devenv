" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.
Plug 'liuchengxu/vim-better-default'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'matze/vim-move'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'Olical/conjure', { 'tag': 'v2.1.2', 'do': 'bin/compile' }

" Initialize plugin system.
call plug#end()

" Place configuration AFTER `call plug#end()`!
let mapleader = "\<Space>"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview
let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

"-- themes
colorscheme PaperColor 
let g:airline_theme = 'term'
let g:airline#extensions#tabline#enabled = 1 	   " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'   " Show just the filename 
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

"-- snipts settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"-- ALE
let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker']
      \}

"-- easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0 

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" nmap  n <Plug>(easymotion-next)
" nmap  N <Plug>(easymotion-prev)

" 2 char searches
nmap m <Plug>(easymotion-s2)
" word mapping
nmap <s-m> :nohl<cr>

highlight EasyMotionMoveHLDefault cterm=bold ctermfg=208 ctermbg=234 guifg=Blue guibg=Yellow cterm=underline
let g:EasyMotion_do_shade = 0
highlight EasyMotionTargetDefault 		ctermfg=205 cterm=bold
highlight EasyMotionTarget 			ctermfg=205 cterm=bold
highlight EasyMotionTarget2FirstDefault 	ctermfg=205 cterm=bold
highlight EasyMotionTarget2First 		ctermfg=205 cterm=bold
highlight EasyMotionTarget2SecondDefault 	ctermfg=205 cterm=bold
highlight EasyMotionTarget2Second 		ctermfg=205 cterm=bold

"-- CLAP"
"let g:clap_provider_grep_delay = 50
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'

nnoremap <leader>* :Clap grep ++query=<cword><cr>
nnoremap <leader>fg :Clap grep<cr>
nnoremap <leader>ff :Clap files --hidden<cr>
nnoremap <leader>fb :Clap buffers<cr>
nnoremap <leader>fw :Clap windows<cr>
nnoremap <leader>fr :Clap history<cr>
nnoremap <leader>fh :Clap command_history<cr>
nnoremap <leader>fj :Clap jumps<cr>
nnoremap <leader>fl :Clap blines<cr>
nnoremap <leader>fL :Clap lines<cr>
nnoremap <leader>ft :Clap filetypes<cr>
nnoremap <leader>fm :Clap marks<cr>

" -- overrides for vim-better-defaults
runtime! plugin/default.vim
set scrolljump=1   " Line to scroll when cursor leaves screen
set shiftwidth=2   " Use indents of 4 spaces
set tabstop=2      " An indentation every four columns
set softtabstop=2  " Let backspace delete indent
let g:vim_better_default_tabs_as_spaces = 1

" -- don't copy delted or yanked text
nnoremap x "_x

nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap c "_c
nnoremap C "_C
vnoremap c "_c

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

nnoremap <leader>c ""c
nnoremap <leader>C ""C
vnoremap <leader>c ""c

