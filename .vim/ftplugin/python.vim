"Highlight real tabs"
highlight Tab guibg=red ctermbg=red
match Tab /\t/

" Allow only 132 columns for python code
if exists('+colorcolumn')
  highlight ColorColumn guibg=gray ctermbg=235
  set colorcolumn=132
endif
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>132v.\+', -1)
