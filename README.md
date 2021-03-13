CtrlP-Sesh.vim - manage your sessions
====================================

What is it?
-----------

This simple extension for CtrlP enables the following:
* global directory to store vim session files
* another global directory to store custom configurations for those vim sessions
* CtrlP frontend and the commands SaveSesh and EditSesh for basic session manipulation

Installation
------------

With vim-plug
* Just add the usual `Plug "eiyashou/ctrlp-sesh.vim"` to your .vimrc/init.vim
* add `sessions` to `g:ctrlp_extensions` in order to enable this extension.
* map something to `:CtrlPOpenSesh` and optionally to `:SaveSesh`.

Commands
--------

* `CtrlPOpenSesh` - shows a list of files in your session directory; choosing a file and hitting enter will execute `:wall`, close all current buffers and source chosen session replacing all currently open buffers
* `CtrlPRenameSesh` - shows a list of sessions and allows you to rename one, alongside its configuration file
* `CtrlPDeleteSesh` - shows a list of sessions and allows you to delete one, alongside its configuration file
* `SaveSesh` - if a session is already opened it will just overwrite it's file like `:mks! <path to session files>` would do, otherwise it will ask for session name and create a session file in `g:ctrlp_seshdir`
* `EditSesh` - opens a special file that's sourced after opening the currently loaded session, right into a new buffer. Will not open anything if there's no currently open session. 

Settings
--------

`g:ctrlp_seshdir` - directory relative to user $HOME dir that will hold the session files. Default value is: `.vimsessions`, which points to `~/.vimsessions`.
`g:ctrlp_seshrc` - directory relative to user $HOME dir that will hold the configuration files for each session. Default value is: `.vimsessions/.vimseshrc`, which points to `~/.vimsessions/.vimseshrc`.

Bugs/Limitations
----------------

* works only on Linux (hardcoded `ls` usage, sorry Windoze)
* expects all the files in the session directory to be session files not dirs
* no docs
