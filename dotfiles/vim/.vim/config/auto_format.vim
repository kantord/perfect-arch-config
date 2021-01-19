
" PRETTIER
" Prettier to format JavaScript/TypeScript/etc files
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1 
let g:prettier#quickfix_enabled = 0
"autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" Auto format using eslint
autocmd BufWrite *.ts CocCommand eslint.executeAutofix
autocmd BufWrite *.tsx CocCommand eslint.executeAutofix
autocmd BufWrite *.js CocCommand eslint.executeAutofix
autocmd BufWrite *.jsx CocCommand eslint.executeAutofix


" Auto format using ALE
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'svelte': ['eslint', 'prettier', 'prettier_standard'],
\  'python': ['autopep8', 'yapf'],
\  'json': ['jq'],
\  'javascript': ['prettier', 'eslint'],
\  'javascriptreact': ['prettier', 'eslint'],
\  'typescript': ['prettier', 'eslint'],
\  'typescriptreact': ['prettier', 'eslint'],
\}
