Plug 'thaerkh/vim-workspace'
Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'

" Session | Workspace
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autocreate = 1

" Vim Sneak
let g:sneak#label = 1

nmap <F3> :TagbarToggle<CR>
