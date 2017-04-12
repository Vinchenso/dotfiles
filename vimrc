execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable
set rtp+=~/.fzf
:set number
:set cursorcolumn
:set colorcolumn=80
set hlsearch
set incsearch
filetype off
set nocompatible
filetype plugin on
autocmd BufRead,BufNewFile *.vue set filetype=vue
let mapleader=","
set tags+=.git/tags
nnoremap <silent> <C-a> :nohl<CR><C-l>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cucumber_cucumber_args="--profile syntastic"
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [ "ruby", "javascript" ] }
nnoremap <leader>c :SyntasticCheck<CR>
nnoremap <leader>x :SyntasticReset<CR>    " Scan file again for syntax erors

 " Index ctags from any project, including those outside Rails
    map <Leader>ct :!ctags -R .<CR>
set t_Co=256
"let g:solarized_termcolors=256
"set background=dark
colorscheme maui
"call togglebg#map("<F5>")

"nnoremap <leader>ct :call BgToggleSol()<cr>
:filetype plugin on

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

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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

let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

"""""""""""""""""""""""
"INdent Guide
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

"""""""""""""""""""""
"Ctrl P
"""""""""""""""""""""
"set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
"set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
"set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
"set wildignore+=*.so                                        " ctrlp - ignore .so files
"set wildignore+=*.o                                         " ctrlp - ignore .o files
"set wildignore+=*.class                                     " ctrlp - ignore .class files
"set wildignore+=*.swp                                       " ctrlp - ignore .swp files
"set wildignore+=*.zip                                       " ctrlp - ignore .zip files
"set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
"set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
"set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
"set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build directory
"let g:ctrlp_show_hidden = 1                                 " ctrlp - search for hidden files

"""""""""""""""""""""
"Inserting Blank Lines
"""""""""""""""""""""
map <Enter> o<ESC>
map <S-Enter> O<ESC>

"""""""""""""""""""""""
"JSX Pretty
"""""""""""""""""""""""

let g:vim_jsx_pretty_enable_jsx_highlight = 0 " default 1
let g:vim_jsx_pretty_colorful_config = 1 " default 0

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




