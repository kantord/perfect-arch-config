" Firenvim specific vim config
if exists('g:started_by_firenvim')
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
  colorscheme github
  set background=light
  let g:dont_write = v:false
  function! My_Write(timer) abort
    let g:dont_write = v:false
    write
  endfunction
endif


let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 1,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }
