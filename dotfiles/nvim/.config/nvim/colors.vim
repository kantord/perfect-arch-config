if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
endif

func LoadThemeCustomization()
  " Highlighting current word
  " https://github.com/dominikduda/vim_current_word
  hi CurrentWord cterm=bold term=bold gui=bold
  hi CurrentWordTwins cterm=bold term=bold gui=bold

  " Highlight current line
  set cursorline

  " Remove sign column background
  hi SignColumn ctermbg=NONE guibg=NONE

  " Coc underline customization
  hi CocUnderline gui=undercurl term=undercurl
  hi CocErrorHighlight guisp=red  gui=undercurl term=undercurl
  hi CocWarningHighlight guisp=yellow gui=undercurl term=undercurl

  " Inactive window fading
  let g:vimade = {
    \ 'enablefocusfading': 1,
    \ }
endfunc

func LoadActiveTheme()
  source /home/kdani/.config/nvim/colorscheme.vim
  call LoadThemeCustomization()
endfunc

call LoadActiveTheme()

func LoadActiveThemeTimer(timer)
  let seconds_since_changed = localtime() - getftime("/home/kdani/.config/nvim/colorscheme.vim")
  if seconds_since_changed < 3
    echo "Loading theme"
    call LoadActiveTheme()
  endif
endfunc
let load_active_theme_timer = timer_start(2000, 'LoadActiveThemeTimer', {'repeat': -1})


