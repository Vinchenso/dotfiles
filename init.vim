" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plug 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plug 'sheerun/vim-polyglot'           " Language support
Plug 'tpope/vim-surround'             " Easily surround words with tags
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tpope/vim-eunuch'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattn/emmet-vim'
Plug 'chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'

" Ruby/Rails
Plug 'tpope/vim-endwise'              " Add 'end' after 'if', 'do', 'def' keywords
Plug 'tpope/vim-rails'                " Rails support in Vim
Plug 'rking/ag.vim'                   " Searching text across file directory
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}

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

set encoding=utf-8
set showcmd                               " display incomplete commands
" set relativenumber
set cursorline                            " Highlight row
set cursorcolumn                          " Highlight column

"set t_Co=256

"" Spacing
" set nowrap                          " don't wrap lines
set tabstop=2 shiftwidth=2          " a tab is two spaces (or set this to 4)
set shiftround
set expandtab                       " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode

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

call deoplete#enable()

if has('nvim')
  " Enable deoplete on startup
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#enable_refresh_always = 1
  let g:deoplete#max_abbr_width = 0
  let g:deoplete#max_menu_width = 0
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

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
