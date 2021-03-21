" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>

" Stage files quickly from within vim
function! g:GitStatus()
    FloatermNew --autoclose=1 tig status
endfunction

" Compose a commit message from within vim
function! g:Commit()
    FloatermNew --autoclose=1 git-cz
endfunction

