" For all text files set 'textwidth' to 78 characters.
setlocal textwidth=78
" Reformat text files using par instead of Vim's built-in engine
" assumes environment set to PARINIT="rTbgqR B=.,?_A_a Q=_s>|"
setlocal formatprg=par
" Also, auto-format and respect numbered lists.
setlocal formatoptions=tcroqan1

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal spell
setlocal spelllang=en_us
