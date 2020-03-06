" Install Vim Plug if not installed

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'wellle/tmux-complete.vim'
Plug 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plug 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plug 'sheerun/vim-polyglot'           " Language support
Plug 'tpope/vim-surround'             " Easily surround words with tags
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tpope/vim-eunuch'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'


Plug 'jiangmiao/auto-pairs'
Plug 'matze/vim-move'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Ruby/Rails
Plug 'tpope/vim-endwise'              " Add 'end' after 'if', 'do', 'def' keywords

" Theme/Styling
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'rakr/vim-one'

call plug#end()

"---------------------------------------------------------------
"           General Settings
"---------------------------------------------------------------
set nocompatible                    " choose no compatibility with legacy vi
set shell=/bin/bash
set autoread
au WinEnter,CursorHold,CursorHoldI * checktime

set encoding=utf-8
set showcmd                               " display incomplete commands
" set relativenumber
set cursorline                            " Highlight row
set cursorcolumn                          " Highlight column
set number
"set t_Co=256

" Always draw the signcolumn.
set signcolumn=yes

"" Spacing
" set nowrap                          " don't wrap lines
set tabstop=2 shiftwidth=2          " a tab is two spaces (or set this to 4)
set shiftround
set expandtab                       " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode

set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" set spell
set cmdheight=2
" set splitbelow
"
" No need for ex mode
nnoremap Q <nop>
vnoremap // y/<C-R>"<CR>
" recording macros is not my thing
map q <Nop>


"" Searching
set hlsearch                            " highlight matches
set incsearch                           " incremental searching
set ignorecase                          " searches are case insensitive...
set smartcase                           " ... unless they contain at least one capital letter
nnoremap <silent> <C-a> :nohl<CR><C-l>  " <Ctrl-a> redraws the screen and removes any search highlighting.

"" Keybindings
let mapleader=","                        " change <leader> to ',' instead of '\'

"" No swap files
set noswapfile

"" Store undo history
set undofile

"" Use system clipboard
set clipboard=unnamedplus

"" Paste the same text multiple times using p
xnoremap p pgvy

filetype plugin on

"---------------------------------------------------------------
"           Other Key bindings and Settings
"---------------------------------------------------------------



" autocmd InsertEnter * :set number         " Set absolute numbering while in insert mode
" autocmd InsertLeave * :set relativenumber " Set relative numbering while out of insert mode
"
" =====================================
"  Deoplete
" =====================================

let g:deoplete#enable_at_startup = 1

" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#auto_complete_delay = 0

let g:echodoc_enable_at_startup=1

" """ TernJS
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:deoplete#file#enable_buffer_path=1

" call deoplete#custom#source('buffer', 'mark', 'ℬ')
" call deoplete#custom#source('tern', 'mark', 'T')
" call deoplete#custom#source('omni', 'mark', '⌾')
" call deoplete#custom#source('file', 'mark', '')


""" Omnifunctions
let g:deoplete#omni#functions = {}

let g:EclimCompletionMethod = 'omnifunc'

let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'javascriptcomplete#CompleteJS'
\]
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
let g:deoplete#omni#functions.html = [
    \ 'htmlcomplete#CompleteTags',
    \ 'xmlcomplete#CompleteTags'
\]
let g:deoplete#omni#functions.xml = 'xmlcomplete#CompleteTags'



" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ 'js',
      \ ]

" =====================================
"  FZF
" =====================================

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-i': 'split',
      \ 'ctrl-s': 'vsplit' }

nnoremap ? :GFiles<CR>

" let g:fzf_files_options =
"       \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
"
"
set rtp+=~/.fzf


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

cnoremap Vs vs 


" Always use vertical diffs
set diffopt+=vertical

"""""""""""""""""""""
"Inserting Blank Lines
"""""""""""""""""""""
map <Enter> o<ESC>
map <S-Enter> O<ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set termguicolors

let g:airline_theme='one'"
colorscheme one
syntax on
set background=dark " for the dark version

let test#strategy = "vimux"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType Auto-Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.prisma setfiletype graphql
" au BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>d <Plug>(ale_fix)

let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'css': ['prettier'],
      \}

let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'html': []
\  }

let g:ale_fix_on_save = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
