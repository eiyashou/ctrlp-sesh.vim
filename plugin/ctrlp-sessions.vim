command! CtrlPSessions cal ctrlp#init(ctrlp#sessions#id())

let g:ctrlp_session_dir = get(g:, 'ctrlp_session_dir', '~/.ctrlp_session')

function! SaveOrCreateSession(newsession)
  if strlen(a:newsession)
    let targetsession = g:ctrlp_session_dir.'/'.a:newsession
  elseif strlen(v:this_session)
    let targetsession = v:this_session
  else
    let session_name = input('Session name: ')
    let targetsession = g:ctrlp_session_dir.'/'.session_name
  endif
  exe 'mks! '.targetsession
  echo 'Saved session to: '.targetsession
endfunction

command! -nargs=? MkS cal SaveOrCreateSession(<q-args>)
