
let g:ctrlp_seshdir = exists('g:ctrlp_seshdir') ? g:ctrlp_seshdir : '.vimsessions'
let g:ctrlp_seshrc = exists('g:ctrlp_seshrc') ? g:ctrlp_seshrc : '.vimsessions/.vimseshrc'

function! SaveSeshVim(newsession)
    if strlen(a:newsession)
        let targetsession = '~/'.g:ctrlp_seshdir.'/'.a:newsession
    elseif strlen(v:this_session)
        let targetsession = v:this_session
    else
        let session_name = input('Session name: ')
        if strlen(session_name)==0 | return | endif
        let targetsession = '~/'.g:ctrlp_seshdir.'/'.session_name
    endif
    exe 'mks! '.targetsession

    echom '\nSaved session to: '.targetsession
endfunction

function! EditSeshRc()
    if strlen(v:this_session)
        let session_name = "~/".g:ctrlp_seshrc."/".split(v:this_session,"/")[-1]
        exe ":e ".session_name.".vim"
    else
        echo "There's currently no session loaded."
    endif
endfunction


command! CtrlPOpenSesh call ctrlp#init(ctrlp#opensesh#id())
command! CtrlPRenameSesh call ctrlp#init(ctrlp#rnsesh#id())
command! CtrlPDeleteSesh call ctrlp#init(ctrlp#delsesh#id())
command! -nargs=? SaveSesh call SaveSeshVim(<q-args>)
command! EditSesh call EditSeshRc()
