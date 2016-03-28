" vim: fdm=marker:et:ts=4:sw=2:sts=2

" Description: vim-signature is a plugin to toggle, display and navigate marks.
"
" Maintainer: Kartik Shenoy
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Exit if the signs feature is not available or if the app has already been loaded (or "compatible" mode set)
if !has('signs') || &cp
  finish
endif
if exists('g:loaded_Signature')
  finish
endif
let g:loaded_Signature = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Global variables                                                                                                 {{{1
"
call signature#utils#Set('g:SignaturePrioritizeMarks',         1                                                     )
call signature#utils#Set('g:SignatureIncludeMarks',            'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
call signature#utils#Set('g:SignatureIncludeMarkers',          ')!@#$%^&*('                                          )
call signature#utils#Set('g:SignatureMarkTextHL',              "SignatureMarkText"                                   )
call signature#utils#Set('g:SignatureMarkTextHLDynamic',       0                                                     )
call signature#utils#Set('g:SignatureMarkLineHL',              "SignatureMarkLine"                                   )
call signature#utils#Set('g:SignatureMarkerTextHL',            "SignatureMarkerText"                                 )
call signature#utils#Set('g:SignatureMarkerTextHLDynamic',     0                                                     )
call signature#utils#Set('g:SignatureMarkerLineHL',            "SignatureMarkerLine"                                 )
call signature#utils#Set('g:SignatureWrapJumps',               1                                                     )
call signature#utils#Set('g:SignatureMarkOrder',               "\p\m"                                                )
call signature#utils#Set('g:SignatureDeleteConfirmation',      0                                                     )
call signature#utils#Set('g:SignaturePurgeConfirmation',       0                                                     )
call signature#utils#Set('g:SignaturePeriodicRefresh',         1                                                     )
call signature#utils#Set('g:SignatureEnabledAtStartup',        1                                                     )
call signature#utils#Set('g:SignatureDeferPlacement',          1                                                     )
call signature#utils#Set('g:SignatureRecycleMarks',            0                                                     )
call signature#utils#Set('g:SignatureErrorIfNoAvailableMarks', 1                                                     )
call signature#utils#Set('g:SignatureForceRemoveGlobal',       1                                                     )
call signature#utils#Set('g:SignatureForceMarkPlacement',      0                                                     )
call signature#utils#Set('g:SignatureForceMarkerPlacement',    0                                                     )
call signature#utils#Set('g:SignatureMap',                     {}                                                    )

highlight link SignatureMarkText   Exception
highlight link SignatureMarkLine   Normal
highlight link SignatureMarkerText WarningMsg
highlight link SignatureMarkerLine Normal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Commands, Autocmds and Maps                                                                                      {{{1
"
call signature#utils#Maps('create')

if has('autocmd')
  augroup sig_autocmds
    autocmd!
    autocmd BufEnter,CmdwinEnter * call signature#sign#Refresh()
    autocmd CursorHold * if g:SignaturePeriodicRefresh
                       \|  call signature#sign#Refresh()
                       \|endif
    autocmd BufEnter,FileType * if (  (&filetype ==? 'nerdtree')
                             \     || (&filetype ==? 'netrw')
                             \     )
                             \|   call signature#utils#Maps('remove')
                             \| endif
    autocmd BufLeave * if (  (&filetype ==? 'nerdtree')
                    \     || (&filetype ==? 'netrw')
                    \     )
                    \|   call signature#utils#Maps('create')
                    \| endif
  augroup END
endif

command! -nargs=0 SignatureToggleSigns call signature#utils#Toggle()
command! -nargs=0 SignatureRefresh     call signature#sign#Refresh('force')
command! -nargs=? SignatureListMarks   call signature#mark#List('buf_curr', <args>)
command! -nargs=? SignatureListMarkers call signature#marker#List(<args>)