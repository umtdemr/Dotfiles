"map :q to buffer delete
cnoreabbrev <expr> q getcmdtype() == ":" && (getcmdline() == 'q' && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1) ? ':BufferClose' : 'q'

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ECOSSE
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace() " trim white-spaces on entry
  autocmd BufEnter,WinEnter node_modules/*/** :LspStop
augroup END

" Highlight on yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Limelight enter and leave
" function! s:goyo_enter()
"   Limelight IndentLinesDisable endfunction

" function! s:goyo_leave()
"   Limelight!
"   IndentLinesEnable
" endfunction

" Toggle Limelight with Goyo
" augroup GoyoLimelight
"   autocmd!
"   autocmd! User GoyoEnter call <SID>goyo_enter()
"   autocmd! User GoyoLeave call <SID>goyo_leave()
" augroup END

" Add variable under cursor to vimspector watch list
" nnoremap <Leader>d? :call AddToWatch()<CR>
" func! AddToWatch()
"   let word = expand("<cexpr>")
"   call vimspector#AddWatch(word)
" endfunction

function! CustomFold()
	return printf('   %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

" Auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
