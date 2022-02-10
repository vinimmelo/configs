" Author: Vinícius Melo
" Email: vinicius.m.melo@me.com
" The Perfect python IDE all configured!!!

" Load Plug
call plug#begin('~/.vim/plugged')

" Use Vim settings, rather then Vi settings (much better!).
" set nocompatible"

" Plugins with Plug
Plug 'scrooloose/nerdtree'  " file list
Plug 'xuyuanp/nerdtree-git-plugin' " Nerdtree git plugin
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'  " themes for statusline
Plug 'davidhalter/jedi-vim'   " jedi for python
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'kien/ctrlp.vim'  " fuzzy search files
Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'mattn/emmet-vim' " emmet vim, nice snippets to html
Plug 'nvie/vim-flake8' " flake8 verification inside vim
Plug 'tpope/vim-fugitive' " git integration inside vim
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'ayu-theme/ayu-vim'

Plug 'pycqa/pylint' " another linter, more annoying
Plug 'ervandew/supertab' " Super tab completion
Plug 'tmhedberg/SimpylFold'
Plug 'jiangmiao/auto-pairs' " auto pairs quotes and parenthesis
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-rails' " rails
Plug 'vim-ruby/vim-ruby' " ruby
Plug 'vim-utils/vim-ruby-fold' "fold
Plug 'vim-scripts/rainbow-end'
Plug 'easymotion/vim-easymotion' " move everywhere
Plug 'mileszs/ack.vim' " search easily
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " vim with go
Plug 'thaerkh/vim-workspace' " Workspace
Plug 'liuchengxu/vim-which-key' " Helper
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'jparise/vim-graphql'
Plug 'jez/vim-better-sml'

call plug#end()

" Set wrap to things that make sense"
set wrap linebreak nolist

"incremental search
set incsearch

"search highlighted, all ocurrences
set hlsearch

"color syntax"
syn on
syntax on
syntax enable
set termguicolors
set encoding=UTF-8

"color scheme"
" colorscheme molokai
" colorscheme jellybeans
" set background=dark

" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" highlight strings inside C comments
let c_comment_strings=1

" status line
set laststatus=2
set linespace=0
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
set laststatus=2
" tablines are cool but are degrading performance
" let g:airline#extensions#tabline#enabled = 1

" Keep git sign column as default (+, -, ~, etc.)
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_max_signs = 10000


" Change leader key to comma
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let maplocalleader = ","
let g:maplocalleader = ","
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" set number"
set number
set relativenumber

"tab config"
set ts=4
set expandtab
set softtabstop=4

" 4 spaces for indenting
set shiftwidth=4
set ai
set cindent
set smartindent
set autoindent
" set indentexpr=

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

" KeyMappings
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

noremap <F4> :Autoformat<CR>
" Buffers Key Map
:nnoremap <Leader><tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <C-X> :bdelete<CR>


" Workspace
nnoremap <leader>s :ToggleWorkspace<CR>

" Python isort
let g:vim_isort_map = '<C-i>'

" Move line with ALT
noremap <M-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <M-down> ddp

" Required to make highlight work for JSX with pure JS
let g:jsx_ext_required = 0
let g:syntastic_java_checkers = []

" NERDTree Ignore
let NERDTreeIgnore = ['\.pyc$']

" Auto format Python Code
let g:formatters_python = ['black']

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

" Ale Configurations
" let g:ale_echo_cursor = 0

" FlyGrep
nnoremap <leader>f :FlyGrep<cr>
" All syntax highlight
let python_highlight_all = 1

let g:spacegray_low_contrast = 0
let g:spacegray_use_italics = 1
let g:spacegray_underline_search = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1


" easy motion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-overwin-f)

" ag search
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>/ :Ack!<Space>

" Go specifcs
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor

" Session | Workspace
let g:workspace_session_directory = $HOME . '/.vim/sessions/'


