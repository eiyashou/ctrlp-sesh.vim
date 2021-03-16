let s:n = exists('s:n') ? s:n : fnamemodify(expand('<sfile>', 1), ':t:r')

let g:ctrlp_seshdir = exists('g:ctrlp_seshdir') ? g:ctrlp_seshdir : '.vimsessions'

if ( exists('g:loaded_ctrlp_'.s:n) && g:loaded_ctrlp_{s:n} )
      \ || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_{s:n} = 1

call add(g:ctrlp_ext_vars, {
    \ 'init': 'ctrlp#'.s:n.'#init()',
    \ 'accept': 'ctrlp#'.s:n.'#accept',
    \ 'lname': 'session:',
    \ 'sname': 'Choose session',
    \ 'type': 'line',
    \ 'sort': 1,
    \ })

function! ctrlp#{s:n}#init()
    return split(system('ls $HOME/'.g:ctrlp_seshdir), '\n')
endfunction

function! ctrlp#{s:n}#accept(mode, str)
    call ctrlp#exit()
    let newname = input("Rename '".a:str."' to: ")
    if strlen(newname)>0
        call rename(expand("~/".g:ctrlp_seshdir."/".a:str),
                  \ expand("~/".g:ctrlp_seshdir."/".newname))
    endif

endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#{s:n}#id()
    return s:id
endfunction

" vim:fen:fdl=0:ts=4:sw=4:sts=4
