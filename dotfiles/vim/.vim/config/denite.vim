
" Go to anything using the Enter key
nnoremap <C-G> :<C-u>DeniteProjectDir buffer file_mru coc-workspace commands coc-command file/rec help -start-filter -match-highlight<CR>


highlight DeniteFilter ctermbg=4 ctermfg=0
highlight DeniteMatch ctermbg=1 ctermfg=0 cterm=bold

" denite
call denite#custom#option('_', {
      \ 'prompt': '',
      \ 'split': 'floating',
      \ 'wincol': &columns / 6,
      \ 'winwidth': &columns * 2 / 3,
      \ 'winrow': &lines / 6,
      \ 'winheight': &lines * 2 / 3,
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'highlight_matched_range': 'DeniteMatch',
      \ 'highlight_matched_char': 'DeniteMatch',
      \ 'highlight_preview_line': 'DeniteMatch',
      \ 'highlight_prompt': 'NormalFloat',
      \ 'highlight_window_background': 'NormalFloat',
      \ 'max_dynamic_update_candidates': 100000
      \ })

call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files'])
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])
call denite#custom#source('_', 'sorters', ['sorter/sublime'])
call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])

autocmd FileType denite call s:denite_settings()

function! s:denite_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-v>
        \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()

function! s:denite_filter_my_settings() abort
	  inoremap <silent><buffer> <C-j>
	  \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
	  inoremap <silent><buffer> <C-k>
	  \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
  inoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
endfunction

let g:fruzzy#usenative = 1
