set encoding=utf8

call plug#begin('~/.vim/plugged') 
"
" Install plugins here
"
"
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'yegappan/greplace'
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'easymotion/vim-easymotion'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'burner/vim-svelte'
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
Plug 'rbgrouleff/bclose.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
Plug 'dkarter/bullets.vim'
"Plug 'wellle/context.vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'metakirby5/codi.vim'
Plug 'kizza/actionmenu.nvim'
Plug 'vim-test/vim-test'
Plug 'brooth/far.vim'
Plug 'markonm/traces.vim'
Plug 'ledger/vim-ledger'
Plug 'deviantfero/wpgtk.vim'
Plug 'majutsushi/tagbar'
Plug 'vimwiki/vimwiki'
Plug '907th/vim-auto-save'
Plug 'dbmrq/vim-ditto'
Plug 'termhn/i3-vim-nav'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'svermeulen/vim-yoink'
"Plug 'justinmk/vim-sneak'
Plug 'rstacruz/vim-hyperstyle'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
"Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Shows number of search matches and position of current match
Plug 'osyo-manga/vim-anzu'
"Plug 'ruanyl/coverage.vim'
Plug 'yggdroot/indentline'
Plug 'raimondi/delimitmate'
Plug 'mg979/vim-visual-multi'
Plug 'antoinemadec/coc-fzf'
Plug 'styled-components/vim-styled-components'

" Denite
Plug 'neoclide/coc-denite'
Plug 'chemzqm/denite-extra'
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Install browser extension here
" https://github.com/voldikss/browser-source-provider
"Plug 'voldikss/coc-browser', {'do': 'yarn install --frozen-lockfile'}

Plug 'liuchengxu/vim-which-key'

Plug 'ruanyl/vim-gh-line'
Plug 'mhinz/vim-startify'
Plug 'krolow/readmestart.vim'
Plug 'cormacrelf/vim-colors-github'
" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'voldikss/vim-floaterm'
Plug 'machakann/vim-highlightedyank'
Plug 'inside/vim-search-pulse'

" Recent files for denite
Plug 'Shougo/neomru.vim'

call plug#end()


" Overview mode
function OverviewMode()
   :CocCommand explorer
   ":TagbarToggle
endfunction
map <C-K><C-B> :exec OverviewMode()<CR>


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
colorscheme wpgtkAlt
hi Normal guibg=NONE ctermbg=NONE

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
" icons https://www.nerdfonts.com/cheat-sheet
" Better glyphs
let g:gitgutter_sign_added=''
let g:gitgutter_sign_modified=''
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_modified_removed=''
let g:gitgutter_override_sign_column_highlight = 0

" Removing background for a e s t h e t i c s
hi! GitGutterAdd ctermbg=NONE ctermfg=Green
hi! GitGutterChange ctermbg=NONE ctermfg=Blue
hi! GitGutterDelete ctermbg=NONE ctermfg=Red
hi! GitGutterChangeDelete ctermbg=NONE ctermfg=Yellow

" Line number looks
hi LineNr ctermbg=NONE ctermfg=9
hi SignColumn ctermbg=NONE
hi CursorLineNr ctermbg=NONE ctermfg=7

hi CursorLine ctermbg=6 ctermfg=0 cterm=none


"--- Searching ---"
" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Better searching
set ignorecase
set smartcase

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
highlight VertSplit ctermfg=9 ctermbg=NONE cterm=NONE
hi StatusLine ctermbg=NONE cterm=NONE guibg=red ctermfg=9
hi StatusLineNC ctermbg=NONE cterm=NONE guibg=green ctermfg=9

set statusline=────
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%#VertSplit#
set statusline+=\ ─\ %p%%\ 

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign
hi ALEErrorSign ctermfg=Red
highlight ALEWarning cterm=bold ctermbg=Black ctermfg=Red
highlight ALEError cterm=bold ctermbg=Black ctermfg=Red

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let mapleader = "\<Space>"

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4


" Flag useless whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe autoclose preview
" let g:ycm_autoclose_preview_window_after_completion=1

" YouCompleteMe go to definition
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


hi default CocUnderline    cterm=underline 
hi default CocErrorSign    ctermfg=9     
hi default CocWarningSign  ctermfg=9   
hi default CocInfoSign     ctermfg=9  
hi default CocHintSign     ctermfg=9    
hi default CocSelectedText ctermfg=Red     
hi default CocCodeLens     ctermfg=8
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
hi CocFloating ctermbg=8
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


"let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
"let g:ale_linters = {'svelte': ['stylelint', 'eslint'], 'javascript': ['eslint'], 'python': ['flake8', 'pylint']}
"let g:ale_fixers = {'svelte': ['eslint', 'prettier', 'prettier_standard'], 'python': ['autopep8', 'yapf'], 'json': ['jq']}
"let g:ale_lint_on_save = 1
"let g:ale_fix_on_save = 1
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_text_changed = 'never'




command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!

:Silent :!stty -ixon -ixoff


let g:fzf_preview_window = 'right:35%'
nmap <silent> <leader>h :History<CR>
"nmap <silent> <C-G> :GFiles<CR>
nmap <silent> <leader>p :Files<CR>
nmap <silent> <leader>g :GFiles?<CR>
nmap <silent> <leader>c :Commits<CR>
nmap <silent> <leader>o :Tags<CR>
nmap <silent> <leader>s :Snippets<CR>
nmap <leader>g :Rg<CR>
nmap <leader>* :Rg <C-R><C-W><CR>

nmap <leader>u :Tags ^<C-R><C-W><CR>

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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

nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

let test#strategy = "basic"
let g:test#javascript#runner = 'jest'


" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"autocmd BufWritePre {**/__test__/*,**/__tests__/*,*.test.*} :%! sed 's/it(\(.*\)should \?/it(\1/'

" Vertical column
set colorcolumn=79
highlight ColorColumn ctermbg=8 ctermfg=7

" i3 integration
nnoremap <silent> <c-l> :call Focus('right', 'l')<CR>
nnoremap <silent> <c-h> :call Focus('left', 'h')<CR>
nnoremap <silent> <c-k> :call Focus('up', 'k')<CR>
nnoremap <silent> <c-j> :call Focus('down', 'j')<CR>

if exists('g:started_by_firenvim')
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
  colorscheme github
  set background=light
  set nonumber
endif


" Clipboard management
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Vimwiki
nmap <Leader>wp :Files ~/vimwiki/<CR>
let g:auto_save = 0
augroup ft_vimwiki
  au!
  au FileType vimwiki let b:auto_save = 1
augroup END

" Preview history of the line
nmap <a-k> <Plug>(git-messenger)
let g:git_messenger_include_diff="current"
function! s:setup_git_messenger_popup() abort
    " Your favorite configuration here

    " For example, set go back/forward history to <C-o>/<C-i>
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

source ~/.vim/config/floating_terminal.vim
source ~/.vim/config/git.vim
source ~/.vim/config/matching_parentheses.vim
source ~/.vim/config/denite.vim


let g:vim_search_pulse_color_list = [1,9]
