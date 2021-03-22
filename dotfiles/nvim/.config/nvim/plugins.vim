call plug#begin()

" List of installed plugins

" COLORSCHEMES
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'mswift42/vim-themes'
Plug 'rakr/vim-two-firewatch'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'junegunn/seoul256.vim'

" EDITING
Plug 'mg979/vim-visual-multi'  " Multiple cursors
Plug 'tpope/vim-rsi'  " Better insert mode
Plug 'markonm/traces.vim'  " Live preview for replacing
Plug 'eugen0329/vim-esearch'  " Multi-file edit

" NAVIGATION
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc-denite'
Plug 'chemzqm/denite-extra'
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}
Plug 'nabezokodaikon/denite-converter-basename_to_top'
Plug 'Shougo/neomru.vim' " Recent files for denite
Plug 'nvim-lua/popup.nvim'  " needed for telescope
Plug 'nvim-lua/plenary.nvim'  " needed for telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'easymotion/vim-easymotion'
Plug 'osyo-manga/vim-anzu'  " Show number of search matches

" LANGUAGE SERVER SUPPORT
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

" FILE MANAGER
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'  " Needed for ranger

" EYE CANDY
Plug 'TaDaa/vimade' " fade inactive splits
Plug 'ryanoasis/vim-devicons'  " fancy icons
Plug 'itchyny/lightline.vim'  " Fancy status line
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Fancy line numbers

" SYNTAX
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-sleuth'  " Automatically detect indentation settings in the buffer - not needed because vim-polyglot includes it
Plug 'tpope/vim-markdown'  " Cool markdown syntax

" AUTOSAVE
Plug '907th/vim-auto-save'

" COMMENTS
Plug 'tyru/caw.vim'  " toggle comment out code using `gcc`. Insert comment using `gci`

" GIT
Plug 'iberianpig/tig-explorer.vim'  " tig integration

" PERSONAL WIKI
Plug 'vimwiki/vimwiki'

" UTILS
Plug 'voldikss/vim-floaterm'  " floating terminal
Plug 'lambdalisue/suda.vim'  " Save with sudo
Plug 'wakatime/vim-wakatime'  " Automated time tracking


" Browser integration
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
