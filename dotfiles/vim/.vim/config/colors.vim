" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

func LoadActiveTheme(timer)
  let seconds_since_changed = localtime() - getftime("/home/kdani/.vim/config/colorscheme.vim")
  if seconds_since_changed < 10
    source ~/.vim/config/colorscheme.vim
    VimadeRedraw
  endif
endfunc
let load_active_theme_timer = timer_start(2000, 'LoadActiveTheme', {'repeat': -1})
source ~/.vim/config/colorscheme.vim

" Inactive window fading
let g:vimade = {
  \ 'enablefocusfading': 1,
  \ }

" Highlighting current word
" https://github.com/dominikduda/vim_current_word
hi CurrentWord cterm=bold term=bold gui=bold
hi CurrentWordTwins cterm=bold term=bold gui=bold

" Highlight current line
set cursorline


" Remove sign column background
hi SignColumn ctermbg=NONE guibg=NONE


let g:rainbow_active = 1

