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
Plug 'nvim-lua/popup.nvim' " Required for telescope.nvim
Plug 'nvim-lua/plenary.nvim' " Required for telescope.nvim
Plug 'nvim-telescope/telescope.nvim'

" LANGUAGE SERVER SUPPORT
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

call plug#end()
