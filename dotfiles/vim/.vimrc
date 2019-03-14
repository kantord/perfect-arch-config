set encoding=utf8
call plug#begin('~/.vim/plugged')

"
" Install plugins here
"
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'heavenshell/vim-prettier'

call plug#end()

" NERDTree settings
map <C-K><C-B> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.cache', '__pycache__', '.git', 'env', 'env2', 'env3', 'venv', 'node_modules']

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if has('nvim')
    nmap <BS> <C-W>h
endif

" CtrlP settings
map <C-T> :CtrlPBufTagAll<Return>
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(env|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp)$',
  \ }
" Use ag to speed up CtrlP
" Use .agignore (with .gitignore syntax) to ignore files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' 

set mouse=a

" Run prettier automatically
autocmd BufWritePost *.js,*.jsx call prettier#run(1)

" System clipboard
set clipboard+=unnamedplus
