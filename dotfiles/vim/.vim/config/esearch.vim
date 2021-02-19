let g:esearch = {}
" Try to jump into the opened floating window or open a new one.
let g:esearch.win_new = {esearch ->
  \ esearch#buf#goto_or_open(esearch.name, {name ->
  \   nvim_open_win(bufadd(name), v:true, {
  \     'relative': 'editor',
  \     'row': &lines / 10,
  \     'col': &columns / 10,
  \     'width': &columns * 8 / 10,
  \     'height': &lines * 8 / 10
  \   })
  \ })
  \}
" Close the floating window when opening an entry.
autocmd User esearch_win_config autocmd BufLeave <buffer> quit
