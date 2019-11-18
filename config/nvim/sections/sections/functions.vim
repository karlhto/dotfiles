" User defined functions
" ----------------------

command! Bclose call <SID>BufClose()
function! <SID>BufClose()
    let l:cur_buf_num = bufnr("%")
    let l:alt_buf_num = bufnr("#")

    if buflisted(l:alt_buf_num)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:cur_buf_num
        new
    endif

    if buflisted(l:cur_buf_num)
        execute("bdelete! ".l:cur_buf_num)
    endif
endfunction

" Delete trailing white space on save
function! DeleteTrailingWS()
    if (&ft =~ 'pandoc' || &ft =~ 'tex')
        return
    endif

    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
