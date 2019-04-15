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
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'steelsojka/deoplete-flow'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-scripts/AutoComplPop'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'yegappan/greplace'
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'

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

" Use system clipboard for
set clipboard=unnamedplus

" Emmet stuff
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Fix linting in flow files
let g:ale_linters = { 
\'javascript': ['flow', 'eslint'],
\}


let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

" Transparent background
colorscheme default-light
hi Normal guibg=NONE ctermbg=NONE

set cursorline
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE

let g:ctrlp_show_hidden = 1

:set number relativenumber

" Line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


"- Git-Gutter -"
" stolen from here https://gitlab.com/Sacules/dotfiles/blob/master/nvim/.config/nvim/init.vim
" Better glyphs
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
let g:gitgutter_override_sign_column_highlight = 0

" Removing background for a e s t h e t i c s
hi! GitGutterAdd ctermbg=NONE
hi! GitGutterChange ctermbg=NONE
hi! GitGutterDelete ctermbg=NONE
hi! GitGutterChangeDelete ctermbg=NONE

" Remove background
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE
hi VertSplit ctermbg=NONE
hi CursorLineNr ctermbg=NONE ctermfg=7


"--- Searching ---"

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Better searching
set ignorecase
set smartcase
