" Author: Vinícius Melo
" Email: vinicius.m.melo@me.com
" The Perfect python IDE all configured!!!

" Load Plug
call plug#begin('~/.vim/plugged')

" Use Vim settings, rather then Vi settings (much better!).
" set nocompatible"

" Plugins with Plug
Plug 'scrooloose/nerdtree'  " file list
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'  " themes for statusline 
Plug 'jonathanfilip/vim-lucius'  " nice white colortheme
Plug 'davidhalter/jedi-vim'   " jedi for python
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
Plug 'kien/ctrlp.vim'  " fuzzy search files
Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'wsdjeg/FlyGrep.vim'  " awesome grep on the fly
Plug 'w0rp/ale'  " python linters
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2'  " awesome autocomplete plugin
Plug 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
Plug 'ncm2/ncm2-path'  " filepath completion
Plug 'mattn/emmet-vim' " emmet vim, nice snippets to html
Plug 'nvie/vim-flake8' " flake8 verification inside vim
Plug 'tpope/vim-fugitive' " git integration inside vim
Plug 'MarcWeber/vim-addon-mw-utils' " snippets
Plug 'tomtom/tlib_vim' " snippets
Plug 'garbas/vim-snipmate' " snippets
Plug 'honza/vim-snippets' " snippets
Plug 'NLKNguyen/papercolor-theme' " papercolor theme
Plug 'tomasr/molokai' " molokai theme
Plug 'scrooloose/syntastic' " syntax verification
Plug 'pycqa/pylint' " another linter, more annoying
Plug 'ervandew/supertab' " Super tab completion
Plug 'tpope/vim-obsession' " Sessions autoload and finished
Plug 'morhetz/gruvbox' " Gruvbox colorscheme
Plug 'tmhedberg/SimpylFold' " Gruvbox colorscheme
Plug 'vim-scripts/indentpython.vim' " better indentation
Plug 'jiangmiao/auto-pairs' " auto pairs quotes and parenthesis
Plug 'Shougo/neocomplete.vim' " better autocomplete
Plug 'hdima/python-syntax' " Better syntax highlight

call plug#end()

" Set wrap to things that make sense"
set wrap linebreak nolist

" Set background type"
set background=dark

"incremental search
set incsearch

"search highlighted, all ocurrences
set hlsearch

"color scheme"

" colorscheme PaperColor
" colorscheme molokai
colorscheme gruvbox

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" highlight strings inside C comments
let c_comment_strings=1

"color syntax"
syn on
syntax on
syntax enable
set encoding=UTF-8

" status line
set laststatus=2
set linespace=0
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
set laststatus=2
" tablines are cool but are degrading performance
"let g:airline#extensions#tabline#enabled = 1

" Keep git sign column as default (+, -, ~, etc.)
"let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_max_signs = 10000

" Change line number color
" (by default gitgutter uses same color as LineNr)
highlight LineNr ctermbg=235

" set number"
set number
set relativenumber

"tab config"
set ts=2
set expandtab
set softtabstop=2

" 4 spaces for indenting
set shiftwidth=2
set autoindent
set cindent

"Disable autoindentation"
set noai

" Enable filetype plugins "
filetype plugin on
filetype plugin indent on

" Disable preview code when using omni complete"
set completeopt=menu

" Allow modelines"
set modelines=1

set spelllang=en,pt_br

" vim markdown settings
let g:vim_markdown_folding_disabled=1

" force vim to use 265 colors
set term=screen-256color

" remove trailing spaces for certain file types
autocmd FileType python,javascript,ruby,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"------------ Mappings --------------"

"+ and - to resize splited windows"
map - <C-W>-
map = <C-W>+

" nnoremap <Leader>b :bp<CR>"
" nnoremap <Leader>f :bn<CR>"

" Makes Ctrl-P plugin ignore .git and everything on .gitignore "
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Let Ctrl-P open buffers:
" Where:
"   i - all files as hidden buffers.
"   j - after opening, jump to the first opened tab or window.
" Source: http://stackoverflow.com/questions/33315406/open-all-selected-files-as-hidden-buffer
let g:ctrlp_open_multiple_files = 'ij'

" For some reason home and end keys are not mapping properly."
" Home key"
imap <esc>OH <esc>0i
cmap <esc>OH <home>
nmap <esc>OH 0
" End key"
nmap <esc>OF $
imap <esc>OF <esc>$a
cmap <esc>OF <end>
" NERDTree Toggle
map <F3> :NERDTreeToggle<CR>
" Tagbar Toggle
nmap <F2> :TagbarToggle<CR>
" Buffers Key Map
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <C-X> :bdelete<CR>
" Python isort
let g:vim_isort_map = '<C-i>'

" Required to make highlight work for JSX with pure JS
let g:jsx_ext_required = 0
let g:syntastic_java_checkers = []

" NERDTree Ignore
let NERDTreeIgnore = ['\.pyc$']

" Auto format Python Code
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

" Jedi Vim options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1
" let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<C-Space>"
let g:jedi#show_call_signatures = "0"
let g:jedi#show_call_signatures_delay = 1.5
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0
let g:jedi#use_tabs_not_buffers = 1

" Change leader key to comma
let mapleader = "," 
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" Enable folding
set foldmethod=indent
set foldlevel=99
let b:SimpylFold_fold_import=1
let b:SimpylFold_fold_docstring=1
let g:SimpylFold_fold_import=1
let g:SimpylFold_fold_docstring=1

" File format
set fileformat=unix

" Copy to clipboard
set clipboard=unnamed

" Use neocomplete.
 
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" All syntax highlight
let python_highlight_all = 1
