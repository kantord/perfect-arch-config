" Features for git integration

function! g:Blame()
    :Silent :!tig blame %
endfunction


function! g:GitStatus()
    FloatermNew --autoclose=1 tig status
endfunction



function! g:Commit()
    FloatermNew --autoclose=1 git-cz
endfunction

map <C-a> :TigBlame<CR>
nnoremap <leader><C-A> :TigOpenProjectRootDir<CR>
map <C-s> :call GitStatus()<CR>
map <C-c> :call Commit()<CR>
