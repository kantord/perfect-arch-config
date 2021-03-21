" Enable line numbers
set number
set relativenumber

" Merge sign column with line numbers
set signcolumn=number

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" see: https://github.com/neoclide/coc.nvim#example-vim-configuration
set updatetime=300

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" CoC documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" I don't like markdown concealing
let g:markdown_syntax_conceal = 0

" Highlight fenced languages in Markdown!
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'typescript']
