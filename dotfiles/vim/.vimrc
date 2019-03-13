call plug#begin('~/.vim/plugged')

"
" Install plugins here
"
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

call plug#end()

" NERDTree settings
map <C-K><C-B> :NERDTreeToggle<CR>
