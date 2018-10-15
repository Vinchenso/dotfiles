" Install Vim Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'prettier/vim-prettier', {
  " \ 'do': 'yarn install',
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chiel92/vim-autoformat'
Plug 'matze/vim-move'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/matchit.zip'
" Plug 'valloric/matchtagalways'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
" Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'maralla/completor.vim'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'rakr/vim-one'
call plug#end()

syntax on
filetype plugin indent on
set rtp+=~/.fzf
set number
set cursorcolumn
set colorcolumn=80
set hlsearch
set incsearch
set nocompatible
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" set filetype=vue.html
set foldmethod=indent
let mapleader=","
set tags=./tags;
nnoremap <silent> <C-a> :nohl<CR><C-l>

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Silver Searcher instead of grep
set grepprg=ag

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>
:filetype plugin on

imap <Tab> <C-P>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Move Settins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:move_key_modifier = 'M'

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Color scheme settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

set termguicolors
let g:airline_theme='one'
let g:one_allow_italics = 1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" benmills/vimux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VimuxUseNearestPane = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-m> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let test#strategy = "vimux"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-prettier
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" let g:prettier#exec_cmd_async = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2 
set shiftwidth=2 " tabs rendered as 2 spaces
set expandtab " expand tabs to spaces (should this be filemode dependent?
set smarttab

set ai "Auto indent
set si "Smart indent

set nobackup
set nowritebackup
set noswapfile

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Set shiftwidth to 2 for heavily nested filetypes
autocmd FileType vue.html setlocal shiftwidth=2
autocmd FileType vue.html setlocal tabstop=2
autocmd FileType vue.html setlocal softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType javascript setlocal tabstop=2
autocmd FileType javascript setlocal softtabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal softtabstop=2
autocmd FileType scss setlocal shiftwidth=2
autocmd FileType scss setlocal tabstop=2
autocmd FileType scss setlocal softtabstop=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" React
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_enable_domhtmlcss = 1
set foldlevel=20
nnoremap <Space> za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git & Github
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set clipboard=unnamedplus

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

"""""""""""""""""""""""
"Indent Guide
"""""""""""""""""""""""
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_guide_size=1
set ts=2 sw=2 et
let g:indent_guides_start_level=2

"""""""""""""""""""""
"EMMET
"""""""""""""""""""""

let g:user_emmet_mode='a'    "enable all function in all mode."
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"""""""""""""""""""""
"Inserting Blank Lines
"""""""""""""""""""""
map <Enter> o<ESC>
map <S-Enter> O<ESC>

"""""""""""""""""""""""
"JSX Pretty
"""""""""""""""""""""""

" let g:vim_jsx_pretty_enable_jsx_highlight = 0 " default 1
" let g:vim_jsx_pretty_colorful_config = 1 " default 0

"""""""""""""""""""""""
"Completor
"""""""""""""""""""""""

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" =====================================
"  Ale
" =====================================

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

let g:ale_fix_on_save = 1

" =====================================
"  FZF
" =====================================
" set fzf's default input to AG instead of find. This also removes gitignore etc


let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_files_options =
      \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

nnoremap <C-p> :FZF<CR>

" command typo mapping
cnoremap WQ wq
cnoremap Wq wq
cnoremap QA qa
cnoremap qA qa
cnoremap Q! q!
cnoremap W! w!
cnoremap W w
cnoremap Q q

" Always use vertical diffs
set diffopt+=vertical
