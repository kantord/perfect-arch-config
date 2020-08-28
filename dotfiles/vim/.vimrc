set encoding=utf8

call plug#begin('~/.vim/plugged') 
"
" Install plugins here
"
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'heavenshell/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'yegappan/greplace'
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/matchit'
Plug 'easymotion/vim-easymotion'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte'
Plug 'dominikduda/vim_current_word'
Plug 'ap/vim-css-color'
Plug 'tell-k/vim-autopep8'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'francoiscabrol/ranger.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
Plug 'dkarter/bullets.vim'
"Plug 'wellle/context.vim'
Plug 'majutsushi/tagbar'
Plug 'iberianpig/tig-explorer.vim'

" coc extensions
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
Plug 'liuchengxu/vim-which-key'

Plug 'ruanyl/vim-gh-line'

call plug#end()


" coc-explorer instead of NERDTree
map <C-K><C-B> :CocCommand explorer<cr>


" NERDTree settings
"let NERDTreeShowLineNumbers=1
" Open NERDTree in the directory of the current file (or /home if no file is open)
"function! NERDTreeToggleInCurDir()
   "If NERDTree is open in the current buffer
  "if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    "exe ":NERDTreeClose"
  "else
    "exe ":NERDTreeFind"
  "endif
"endfunction

"map <C-K><C-B> :call NERDTreeToggleInCurDir()<cr>
"let NERDTreeShowHidden=1
"let NERDTreeIgnore = ['\.pyc$', '\.cache', '__pycache__', '.git', 'env', 'env2', 'env3', 'venv', 'node_modules']

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
autocmd BufWritePost *.js,*.jsx,*.svelte,*.ts,*.tsx call prettier#run(1)

" Use system clipboard for
set clipboard=unnamedplus

" Emmet stuff
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:neosnippet#enable_completed_snippet = 1

" Transparent background
colorscheme default-light
hi Normal guibg=NONE ctermbg=NONE

"set cursorline
"hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE

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
let g:gitgutter_sign_added='➕'
let g:gitgutter_sign_modified='✍️'
let g:gitgutter_sign_removed='🚮'
let g:gitgutter_sign_removed_first_line='🚮'
let g:gitgutter_sign_modified_removed='✍️'
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

let g:NERDTreeWinSize = 28
let g:NERDTreeMinimalUI = 1


set scrolloff=8 " The screen will only scroll when the cursor is 8 characters from the top/bottom.
set ffs=unix,dos,mac " Prioritize unix as the standard file type.
set wildmenu " Enable the 'autocomplete' menu when in command mode (':').

set showmatch " Will highlight matching brackets.
set mat=2 " How long the highlight will last.
set ttyfast " Will send characters over a terminal connection faster. We do have fast connections after all.
set ruler " Always show current cursor position, which might be needed for the character column location.
set hidden " Abandon buffer when closed, which is usually what we want to do in this case.
set lazyredraw " Good performance boost when executing macros, redraw the screen only on certain commands.
set backspace=2 " Used for making backspace work like in most other editors (e.g. removing a single indent).

set undodir=~/.vim/undodir " Where do we store all this awesomeness?!?!
set undofile " Persistent undos are completely freaking awesome!!!
set noswapfile " Don't create swap files, nowadays we should have enough memory to store a text file.
set nowritebackup " If Vim crashes often then turn backups on again, look at docs for more information.
set autoread " Reload file when it has been changed externally.


" Custom built status-bar
set fillchars+=vert:│,
set fillchars+=stl:─,stlnc:─
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
hi VertSplit cterm=NONE
hi StatusLine ctermbg=NONE cterm=NONE guibg=red
hi StatusLineNC ctermbg=NONE cterm=NONE guibg=green

set statusline=────
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%#VertSplit#
set statusline+=\ ─\ %p%%\ 

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✗'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
hi ALEErrorSign ctermfg=Red
highlight ALEWarning cterm=bold ctermbg=Black ctermfg=Red
highlight ALEError cterm=bold ctermbg=Black ctermfg=Red

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let mapleader = "\<Space>"
map <Leader> <Plug>(easymotion-prefix)

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4


" Color scheme fixes
hi LineNr ctermfg=Gray
hi CursorLineNr ctermfg=White

" Flag useless whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe autoclose preview
" let g:ycm_autoclose_preview_window_after_completion=1

" YouCompleteMe go to definition
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


hi default CocUnderline    cterm=underline 
hi default CocErrorSign    ctermfg=LightRed     
hi default CocWarningSign  ctermfg=LightRed   
hi default CocInfoSign     ctermfg=LightRed  
hi default CocHintSign     ctermfg=LightRed    
hi default CocSelectedText ctermfg=Red     
hi default CocCodeLens     ctermfg=Black    
hi default link CocErrorFloat       CocErrorSign
hi default link CocWarningFloat     CocWarningSign
hi default link CocInfoFloat        CocInfoSign
hi default link CocHintFloat        CocHintSign
hi default link CocErrorHighlight   CocUnderline
hi default link CocWarningHighlight CocUnderline
hi default link CocInfoHighlight    CocUnderline
hi default link CocHintHighlight    CocUnderline
hi default link CocListMode ModeMsg
hi default link CocListPath Comment
hi CocFloating ctermbg=Black
hi default link CocHighlightText  CursorColumn

hi default link CocHoverRange     Search
hi default link CocCursorRange    Search
hi default link CocHighlightRead  CocHighlightText
hi default link CocHighlightWrite CocHighlightText



hi Directory cterm=bold
hi CurrentWord cterm=bold
hi CurrentWordTwins cterm=bold
hi MatchParen cterm=bold ctermbg=Black ctermfg=White

let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
set nofoldenable


let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'svelte': ['stylelint', 'eslint'], 'javascript': ['eslint'], 'python': ['flake8', 'pylint']}
let g:ale_fixers = {'svelte': ['eslint', 'prettier', 'prettier_standard'], 'javascript': ['prettier', 'eslint'], 'python': ['autopep8', 'yapf'], 'json': ['jq'], 'typescript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'




command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!

function! g:Blame()
    :Silent :!tig blame %
endfunction

function! g:Status()
    :Silent :!tig status %
endfunction

function! g:Commit()
    :Silent :!git-cz
endfunction



map <C-a> :TigBlame<CR>
nnoremap <leader><C-A> :TigOpenProjectRootDir<CR>
map <C-s> :call Status()<CR>
map <C-c> :call Commit()<CR>
:Silent :!stty -ixon -ixoff


let g:fzf_preview_window = 'right:35%'
nmap <silent> <leader>h :History<CR>
nmap <silent> <C-P> :GFiles<CR>
nmap <silent> <leader>p :GFiles<CR>
nmap <silent> <leader>g :GFiles?<CR>
nmap <silent> <leader>c :Commits<CR>
nmap <silent> <leader>o :Tags<CR>
nmap <silent> <leader>s :Snippets<CR>
nmap <leader>g :Rg<CR>
nmap <leader>* :Rg <C-R><C-W><CR>

" ACTION: Find: Usages of tag under the cursor	
nmap <leader>u :Tags ^<C-R><C-W><CR>

" ACTION: Go to: Definition
nmap <silent> gd <Plug>(coc-definition)

" ACTION: Go to: Type definition
nmap <silent> gy <Plug>(coc-type-definition)

" ACTION: Go to: Implementation
nmap <silent> gi <Plug>(coc-implementation)

" ACTION: Go to: References
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Generate ~/.vim_actions
:call system('/home/kdani/repos/perfect-arch-config/dotfiles/vim/generate_vim_actions.sh')

let s:TYPE = {'dict': type({}), 'funcref': type(function('call')), 'string': type(''), 'list': type([])}

if v:version >= 704
  function! s:function(name)
    return function(a:name)
  endfunction
else
  function! s:function(name)
    " By Ingo Karkat
    return function(substitute(a:name, '^s:', matchstr(expand('<sfile>'), '<SNR>\d\+_\zefunction$'), ''))
  endfunction
endif

function! s:run_action(line)
  let key = matchstr(a:line, '\t.*$')
  redraw
  "call normal(key)
  execute "normal ".key
endfunction

function! VimActions(...)
  let input = readfile('/home/kdani/.vim_actions')
  call fzf#run(fzf#wrap({'source': input, 'sink':    s:function('s:run_action')}))
endfunction

command! -bar -bang VimActions                           call VimActions(<bang>0)

let g:rainbow_active = 1

let g:tagalong_verbose = 1


nmap <F8> :TagbarToggle<CR>

let g:context_presenter = 'vim-popup'
let g:context_border_char = '─'
let g:context_max_height = 2


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn="auto"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Coc.vim autocomplete with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show commands.
nnoremap <silent><nowait> <space>a  :<C-u>CocList commands<cr>

inoremap <silent><expr> <NUL> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --theme base16 --style=header,grid --line-range :300 {}'"

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

set laststatus=2

let g:gh_gitlab_domain='https://gitlab.skypicker.com'
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


highlight WhichKeyFloating ctermfg=White
