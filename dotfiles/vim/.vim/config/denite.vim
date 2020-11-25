
" Go to anything using the Enter key
nnoremap <C-G> :<C-u>DeniteProjectDir file_mru commands coc-command file/rec -start-filter -match-highlight<CR>


highlight DeniteFilter ctermbg=4 ctermfg=0
highlight DeniteMatch ctermbg=1 ctermfg=0
highlight DeniteSelection ctermbg=4 ctermfg=0

" denite
call denite#custom#option('_', {
      \ 'prompt': '',
      \ 'split': 'floating',
      \ 'wincol': &columns / 6,
      \ 'winwidth': &columns * 2 / 3,
      \ 'winrow': &lines / 6,
      \ 'winheight': &lines * 2 / 3,
      \ 'match_highlight': v:true,
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'highlight_matched_range': 'DeniteMatch',
      \ 'highlight_matched_char': 'DeniteMatch',
      \ 'highlight_preview_line': 'Search',
      \ 'highlight_prompt': 'NormalFloat',
      \ 'highlight_window_background': 'NormalFloat',
      \ 'max_dynamic_update_candidates': 100000
      \ })

call denite#custom#var('file/rec', 'command',
      \ ['fd', '-H', '--full-path'])
call denite#custom#source(
    	\ 'file/rec', 'matchers', ['matcher/fruzzy'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--smart-case', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

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


