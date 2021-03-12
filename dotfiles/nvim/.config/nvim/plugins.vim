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

" NAVIGATION
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc-denite'
Plug 'chemzqm/denite-extra'
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}
Plug 'nabezokodaikon/denite-converter-basename_to_top'
Plug 'Shougo/neomru.vim' " Recent files for denite

" LANGUAGE SERVER SUPPORT
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

" FILE MANAGER
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'  " Needed for ranger

" EYE CANDY
Plug 'TaDaa/vimade' " fade inactive splits
Plug 'ryanoasis/vim-devicons'  " fancy icons
Plug 'itchyny/lightline.vim'  " Fancy status line

" SYNTAX
Plug 'tpope/vim-sleuth'  " Automatically detect indentation settings in the buffer

call plug#end()
