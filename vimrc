execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable
:set number

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cucumber_cucumber_args="--profile syntastic"

set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

nnoremap <leader>ct :call BgToggleSol()<cr>
:filetype plugin on

let mapleader=","

imap <Tab> <C-P>

let g:turbux_runner = 'vimux'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" benmills/vimux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VimuxUseNearestPane = 1
" Setup filetype specific <leader>a commands in ftplugin

nnoremap <leader>l :call VimuxRunLastCommand()<CR>
nnoremap <leader>vp :call VimuxPromptCommand()<CR>
nnoremap <leader>vi :call VimuxInterruptRunner()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jgdavey/vim-turbux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>t <Plug>SendTestToTmux
map <leader>s <Plug>SendFocusedTestToTmux
let g:turbux_command_rspec = 'rspec'
let g:turbux_command_cucumber = 'cucumber'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2 shiftwidth=2 " tabs rendered as 2 spaces
set expandtab " expand tabs to spaces (should this be filemode dependent?

set ai "Auto indent
set si "Smart indent

set nobackup
set nowritebackup
set noswapfile

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" React
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_enable_domhtmlcss = 1
set foldmethod=syntax
set foldlevel=20
nnoremap <Space> za
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git & Github
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set clipboard=unnamed,unnamedplus

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
