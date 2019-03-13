call plug#begin('~/.vim/plugged')

"
" Install plugins here
"
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

call plug#end()

" NERDTree settings
map <C-K><C-B> :NERDTreeToggle<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if has('nvim')
    nmap <BS> <C-W>h
endif

set mouse=a
